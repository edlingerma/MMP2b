class ApplicationController < ActionController::Base
  helper_method :current_user, :current_amount

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in
    unless current_user
      redirect_to signup_path, notice: 'You must be logged in.'
    end
  end

  def current_amount(activity)
    activities_amount = 0
    entries = activity.entries
    entries.each do |entry|
      activities_amount += entry.amount
    end
    activities_amount
  end
end
