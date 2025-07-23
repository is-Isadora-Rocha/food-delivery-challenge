class Api::OrdersController < ApplicationController

  def user_orders
    user = User.find(params[:user_id])
    render json: user.orders, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Usuário não encontrado" }, status: :not_found
  end


  def create
    order = Order.new(order_params)
    if order.save
      render json: order, status: :created
    else
      puts order.errors.full_messages
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def by_user
    user = User.find_by(id: params[:user_id])
    if user
      render json: user.orders
    else
      render json: { error: "Usuário não encontrado" }, status: :not_found
    end
  end

  private

    def order_params
    params.require(:order).permit(
      :user_id,
      :pickup_address,
      :delivery_address,
      :items_description,
      :requested_at,
      :estimated_price
    )
    end
end
