class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_or_initialize_by(email: params[:email])
    user.name = params[:name]

    if user.save
      session[:user_id] = user.id
      redirect_to orders_path
    else
      flash[:alert] = "Você precisa preencher nome e email."
      redirect_to new_session_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
