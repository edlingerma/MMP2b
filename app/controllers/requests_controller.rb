class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :reject]
  before_action :logged_in, only: [:accept, :reject]

  def accept
    if @request.update(confirmed: true)
      redirect_to show_owner_challenge_path(@challenge), notice: 'Successfully accepted.'
    else
      redirect_to show_owner_challenge_path(@challenge), notice: 'Oops, there was a problem with your request acception. Please try again.'
    end
  end

  def reject
    if @request.destroy
      redirect_to show_owner_challenge_path(@challenge), notice: 'Request successfully removed.'
    else
      redirect_to show_owner_challenge_path(@challenge), notice: 'Oops, there was a problem with your request rejection. Please try again.'
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
    @challenge = @request.challenge
  end

  def logged_in
    unless current_user
      redirect_to signup_path, notice: 'You must be logged in.'
    end
  end
end
