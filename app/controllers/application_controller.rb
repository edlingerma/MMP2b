class ApplicationController < ActionController::Base
  helper_method :current_user, :num_requests
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
  
  def num_requests
    if current_user
      challenges = Challenge.all
      num_requests = 0
      challenges.each do |challenge|
        @challenge = challenge
        num_requests += challenge.unconfirmed_requests.length if is_owner
      end
      num_requests
    end
  end
end
