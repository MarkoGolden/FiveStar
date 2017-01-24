class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  
  def index
    @mobiles = Customer.pluck(:mobile)
    @agents = User.where("role = ?", 2).pluck(:fname, :id)
    @franchises = User.where("role = ?", 1).pluck(:fname, :id)
    @customers_csv = (policy_scope Customer).order("id desc")
    @customers = (policy_scope Customer).order("id desc").page params[:page]
    authorize Customer.new, :index?
 
  respond_to do |format|
    format.html
    format.csv { send_data @customers_csv.as_csv }
  end


  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    authorize @customer, :show?
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    authorize @customer, :new?
  end

  # GET /customers/1/edit
  def edit
    authorize @customer, :edit?
  end
  def filter_customer
    @mobiles = Customer.pluck(:mobile)
    @agents = User.where("role = ?", 2).pluck(:fname, :id)
    @franchises = User.where("role = ?", 1).pluck(:fname, :id)
    @customers = policy_scope Customer
     if params[:search].present?
      if params[:search][:mobile].present? || params[:search][:agent].present? || params[:search][:franchise].present?
        mobile = params[:search][:mobile]
        agent = params[:search][:agent]
        franchise = params[:search][:franchise]
        if mobile.present?
          @customers = @customers.where(mobile: mobile).page params[:page]
        end
        if agent.present?
          @customers = @customers.where(user_id: agent).page params[:page]
        end
        if franchise.present?
          user = User.where(owner_id: franchise).pluck(:id)
          @customers = @customers.where(user_id: user).page params[:page]
        end
      else
        @customers = @customers.page(params[:page])
      end
    end
    render 'index' 
  end
  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    authorize @customer, :destroy?
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def franchise_user
    if params[:customer].present?
      user = params[:customer][:franchise_user]
      @customers = Customer.where(user: user)
    end
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :mobile, :address, :photo, :gps_location, :id_pp, :sex, :disabled, :race, :number_in_household, :terms_agreed, :start_date, :end_date, :end_date_reason, :power_pack_paid, :lease_stove, :stove_number, :installed, :fuel_cook, :cook_kerosene, :cook_coal, :cook_wood, :cook_charcoal, :cook_lpg, :cook_cng, :cook_electricity, :fuel_heat, :heat_kerosene, :heat_coal, :heat_wood, :heat_charcoal, :heat_lpg, :heat_cng, :heat_electricity, :user_id)
    end
end
