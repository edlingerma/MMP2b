class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :reject]

  def accept
    if @request.update(confirmed: true)
      redirect_to show_owner_challenge_path(@challenge), success: 'Successfully accepted.'
    else
      redirect_to show_owner_challenge_path(@challenge), error: 'Oops, there was a problem with your acception. Please try again.'
    end
  end

  def reject
    if @request.destroy
      redirect_to show_owner_challenge_path(@challenge), success: 'Successfully removed.'
    else
      redirect_to show_owner_challenge_path(@challenge), error: 'Oops, there was a problem with your rejection. Please try again.'
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
    @challenge = @request.challenge
  end
end
