class Api::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { error: I18n.t("errors.user.not_found") }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
