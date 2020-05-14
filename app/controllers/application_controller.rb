# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

class ApplicationController < ActionController::Base
  helper_method :current_user, :num_requests, :is_member, :is_owner
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

  def is_member(challenge)
    return false unless current_user

    requests = current_user.requests
    requests.each do |request|
      if request.challenge == challenge && request.confirmed
        return true
      end
    end
    false
  end

  def is_owner(challenge)
    return false unless current_user

    current_user == challenge.owner
  end

  def num_requests
    if current_user
      challenges = Challenge.all
      num_requests = 0
      challenges.each do |challenge|
        num_requests += challenge.unconfirmed_requests.length if challenge.owner == current_user
      end
      num_requests
    end
  end
end
