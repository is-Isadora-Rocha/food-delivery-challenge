class OrdersController < ApplicationController
  before_action :set_user

  def index
    @orders = @user.orders
  end

  def new
    @order = Order.new
  end

  def create
    @order = @user.orders.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def order_params
    params.require(:order).permit(:description, :address, :status)
  end
end
