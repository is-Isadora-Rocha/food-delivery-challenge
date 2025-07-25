class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def render_error(message, status = :unprocessable_entity)
    render json: { error: message }, status: status
  end


end
