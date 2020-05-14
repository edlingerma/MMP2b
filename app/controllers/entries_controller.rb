# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class EntriesController < ApplicationController
  before_action :logged_in, only: [:create, :new]

  def new
    @activity = Activity.find(params[:activity_id])
    @entry = Entry.new
    @entry.activity = @activity
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    unless is_member(@entry.activity.challenge)
      redirect_to @entry.activity.challenge, warning: 'You must be a member of this challenge.'
    end
    if @entry.activity.goal < @entry.activity.amount + @entry.amount
      @entry.amount = @entry.activity.goal - @entry.activity.amount
    end

    if @entry.save
      redirect_to @entry.activity.challenge, success: 'Entry was successfully confirmed.'
    else
      redirect_to @entry.activity.challenge, error: 'Oops, there was an error with your entry. Did you enter a valid number? Please try again.'
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:amount, :activity_id)
  end
end
