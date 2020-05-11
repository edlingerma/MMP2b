class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :reject]
  before_action :logged_in, only: [:accept, :reject]

  def accept 
    if @request.update(confirmed: true)
        redirect_to show_owner_challenge_path(@challenge), notice: 'Request was successfully accepted.'
    else
        redirect_to show_owner_challenge_path(@challenge), notice: 'Request was NOT successfully accepted.'
    end
  end
  

  # TODO Ignore Button
  def reject
    if @request.destroy
        redirect_to show_owner_challenge_path(@challenge), notice: 'Request was successfully rejected.'
    else
        redirect_to show_owner_challenge_path(@challenge), notice: 'Request was NOT successfully rejected.'
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
  