# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :reject]

  def accept
    unless is_owner(@challenge)
      redirect_to show_owner_challenge_path(@challenge), warning: 'You must be the owner of this challenge.'
      return
    end
    if @request.update(confirmed: true)
      redirect_to show_owner_challenge_path(@challenge), success: 'Successfully accepted.'
      return
    else
      redirect_to show_owner_challenge_path(@challenge), error: 'Oops, there was a problem with your acception. Please try again.'
      return
    end
  end

  def reject
    unless is_owner(@challenge)
      redirect_to show_owner_challenge_path(@challenge), warning: 'You must be the owner of this challenge.'
      return
    end
    if @request.destroy
      redirect_to show_owner_challenge_path(@challenge), success: 'Successfully removed.'
      return
    else
      redirect_to show_owner_challenge_path(@challenge), error: 'Oops, there was a problem with your rejection. Please try again.'
      return
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
    @challenge = @request.challenge
  end
end
