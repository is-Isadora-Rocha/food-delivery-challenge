class SessionsController < ApplicationController
  def new
    @user_login = UserLogin.new
  end

  def create
    @user_login = UserLogin.new(login_params)

    if @user_login.valid?
      user = User.find_or_initialize_by(email: @user_login.email)
      user.name = @user_login.name

      if user.save
      session[:user_id] = user.id
      redirect_to orders_path
      else
        flash[:alert] = I18n.t("errors.user.not_found")
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = I18n.t("login.errors.blank_fields")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    # redirect_to new_session_path
    render :new, status: :unprocessable_entity
  end


  private

  def login_params
    params.require(:user_login).permit(:name, :email)
  end
end
