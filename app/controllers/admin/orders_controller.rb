class Admin::OrdersController < ApplicationController

  require 'net/http'
  require 'uri'
  require 'json'

  def search_form
    # @users = User.all.order(:id)
  end

  def search_results
    @users = User.all.order(:id)

    user_id = params[:user_id]

    if user_id.blank?
      flash.now[:alert] = "Por favor, informe um ID de usuário."
      @orders = []
    else
      @orders = Order.where(user_id: user_id)

      if @orders.empty?
        flash.now[:notice] = "Nenhum pedido encontrado para o usuário #{user_id}."
      end
    end

    render :search_form

  end
end
