class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :reject]
  before_action :logged_in, only: [:new, :request_membership]

  def accept 
    if @request.update(confirmed: true)
        redirect_to @challenge, notice: 'Request was successfully accepted.'
    else
        redirect_to @challenge, notice: 'Request was NOT successfully accepted.'
    end
  end
  

  # TODO Ignore Button
  def reject
    if @request.destroy
        redirect_to @challenge, notice: 'Request was successfully rejected.'
    else
        redirect_to @challenge, notice: 'Request was NOT successfully rejected.'
    end
  end




  private

  def set_request
    @request = Request.find(params[:id])
    @challenge = @request.challenge
  end

  #TODO is_owner
  


  def logged_in
    unless current_user
      redirect_to signup_path, notice: 'You must be logged in.'
    end
  end

end
  