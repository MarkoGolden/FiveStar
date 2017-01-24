class ProductsController < ApplicationController
  def index
  	@products = Product.all.order("id desc").page params[:page]
    authorize @products, :index?
  end

  def show
  	@product = current_resource
    authorize @product, :show?
  end

  def new
  	@product = Product.new
    authorize @product, :new?
  end

def create
	@product = Product.new(project_params)
	if @product.save
		redirect_to products_path, notice: "Product Created"
	else
		render 'new'
	end
end

	def edit
		@product = current_resource
    authorize @product, :new?
	end

	def update
		@product = current_resource

		if @product.update(project_params)
			redirect_to @product, notice: "Product Updated"
		else
			render 'edit'
		end
	end

	def destroy
  	@product = current_resource
  	@product.destroy
  	redirect_to products_url,  notice: "Product Deleted"
  end

  private
  def project_params
    params.require(:product).permit(:name, :price, :code)
  end

 def current_resource
  	@current_resource ||= Product.find(params[:id]) if params[:id]

  end


end
