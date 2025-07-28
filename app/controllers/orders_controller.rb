class OrdersController < ApplicationController
  #before_action :set_user

  def by_user_form
  end

  def by_user
    user_id = params[:user_id]

    if user_id.blank?
      flash.now[:alert] = I18n.t("errors.user.blank_id")
      return render :by_user_form
    end

    @user = User.find_by(id: user_id)

    unless @user
      flash.now[:alert] = I18n.t("errors.user.not_found")
      return render :by_user_form
    end

    @orders = @user.orders

    if @orders.empty?
      flash.now[:notice] = I18n.t("errrors.user.no_orders")
    end

    render :index

  end

  def index
    @orders = current_user.orders
    options = {page: params[:page] || 1, per_page: 3}
    @orders = @orders.paginate(options)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.requested_at = Time.current

    if @order.save
      redirect_to orders_path, notice: 'Pedido criado com sucesso!'
    else
      puts @order.errors.full_messages
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:pickup_address, :delivery_address, :items_description, :estimated_price)
  end
end
