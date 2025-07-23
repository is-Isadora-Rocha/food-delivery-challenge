class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user

    def current_user
      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
    end

  end
end
