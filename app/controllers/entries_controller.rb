# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class EntriesController < ApplicationController
  before_action :set_entry, only: [:destroy]
  before_action :logged_in, only: [:create, :new]

  def new
    @activity = Activity.find(params[:activity_id])
    @entry = Entry.new
    @entry.activity = @activity
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    check_membership
    check_valid_number(@entry.amount)
    calculate_amount
    check_save(@entry)
  end

  def destroy
    unless is_owner(@entry.activity.challenge)
      redirect_to @entry.activity.challenge, warning: 'You must be the owner to delete this entry.'
      return
    end
    @entry.destroy
    redirect_to show_owner_challenge_path(@entry.activity.challenge), success: 'Entry was successfully deleted.'
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:amount, :activity_id)
  end

  def check_membership
    unless is_member(@entry.activity.challenge)
      redirect_to @entry.activity.challenge, warning: 'You must be a member of this challenge.'
      return
    end
  end

  def calculate_amount
    temp = @entry.activity_goal - @entry.activity_amount
    if @entry.amount > temp
      @entry.amount = temp
    end
  end

  def check_valid_number(number)
    unless number && number >= 1
      redirect_to @entry.activity.challenge, warning: 'Did you enter a valid number?'
      return
    end
  end

  def check_save(entry)
    if entry.save
      redirect_to entry.activity.challenge, success: 'Entry was successfully confirmed.'
    else
      redirect_to entry.activity.challenge, error: 'Oops, there was an error with your entry. Did you enter a valid number? Please try again.'
    end
  end
end
