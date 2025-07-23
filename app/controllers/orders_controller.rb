class OrdersController < ApplicationController
  #before_action :set_user

  def index
    #@user = User.find(params[:user_id])
    #@orders = @user.orders

    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = User.first
    @order.requested_at = Time.current
    if @order.save
      redirect_to orders_path
    else
      puts @order.errors.full_messages
      render :new
    end
  end

  private

  def set_user
    #@user = User.find(session[:user_id])
    @user = User.first
  end

  def order_params
    params.require(:order).permit(:pickup_address, :delivery_address, :items_description, :estimated_price, :requested_at)
  end
end
