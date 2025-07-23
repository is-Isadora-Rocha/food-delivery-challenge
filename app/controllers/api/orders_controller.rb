class Api::OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    if order.save
      render json: order
    else
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
    params.permit(:user_id, :description, :address, :status)
  end
end
