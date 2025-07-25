class Api::OrdersController < ApplicationController

   skip_before_action :verify_authenticity_token

  def user_orders
    user = User.find(params[:user_id])
    render json: user.orders, status: :ok

  rescue ActiveRecord::RecordNotFound
    render json: { error: I18n.t("errors.user.not_found") }, status: :not_found

  end


  def create
  order = Order.new(order_params)

  if order.save
    render json: order, status: :created
  else
    render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
  end
end


  def by_user
    # Rails.logger.info "Parâmetro id recebido: #{params[:id]}"
    # Rails.logger.info "Usuários no banco: #{User.pluck(:id, :name).inspect}"

    user = User.find_by(id: params[:id])
    if user
      # render json: user.orders
      render json: user.orders, status: :ok
    else
      render json: { error: I18n.t("errors.user.not_found") }, status: :not_found
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
