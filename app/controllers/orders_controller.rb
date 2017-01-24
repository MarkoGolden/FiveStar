class OrdersController < ApplicationController
  def index
    @orders = (policy_scope(Order)).order("id desc").page params[:page]    
    authorize @orders, :index?
  end

  def show
    @order = Order.find(params[:id])
    authorize @order, :show?
  end

  def new
    @order = Order.new
    authorize @order, :new?
  end


  def create
    @order = Order.new(order_params)
    if @order.save
      #Usermailer.ordercreated_email(@order).deliver
      redirect_to @order, notice: "order Created"
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      #if @order.status == "Available for Agent"
      #  Usermailer.orderforagent_email(@order).deliver
      #elsif @order.status == "Delivered"
       # Usermailer.orderdelivered_email(@order).deliver
      #elsif @order.status == "Complete"
       # Usermailer.ordercomplete_email(@order).deliver
      #elsif @order.status == "Cancelled"
       # Usermailer.ordercancelled_email(@order).deliver
      #end
      redirect_to @order, notice: "Order Updated"
    else
      render 'edit'
    end
  end

  def import
    authorize Order.new, :import?
    if params[:file].present?
      @message = Order.import(params[:file])
      @orders = policy_scope(Order).page params[:page]    
      render 'index'
    else
      redirect_to orders_path
      flash[:error] = "Choose a CSV file before importing"
    end

  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: "Order Deleted"
  end

  def bulkupdate
    condition = {}
    condition[:id] = params[:order_id]
    if current_user.franchise? 
      condition[:status] = ["New", "Processing by Franchise", "Available for Agent"]
    elsif current_user.agent? 
      condition[:status] = ["Available for Agent"] + Order::AGENT_STATUS
    end
    Order.where(condition).update_all( :status => params[:bulkupdate][:status])
    flash[:notice] = "Orders that are open for update are updated."
    redirect_to orders_url
  end

  def export
  end

  def filter
    @orders = policy_scope(Order)

    if params[:search].present?
      status = params[:search][:status]
      from = params[:search][:start_date]
      to = params[:search][:end_date]
      to = Time.now unless to.present?
    
      if(params[:commit] == 'Export As CSV') 
        send_data Order.as_csv(status, from, to), :filename => 'orders.csv'
      else
        if status.present?
          @orders = @orders.where(status: status)
        end
        if from.present? 
          if from == to 
            @orders = @orders.where(created_at: (from.to_datetime.beginning_of_day)..(to.to_datetime.end_of_day))
          else
            @orders = @orders.where(created_at: from...to)
          end
        end
        @orders = @orders.page params[:page]
        render "index"
      end
    end
  end

private

def order_params
  params.require(:order).permit(:status, :product_id, :customer_id, :reference)
end

end
