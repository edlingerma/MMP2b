class ApplicationController < ActionController::Base
  helper_method :current_user, :current_amount
  add_flash_types :info, :error, :warning, :success

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in
    unless current_user
      redirect_to signup_path, warning: 'You must be logged in.'
    end
  end
end
