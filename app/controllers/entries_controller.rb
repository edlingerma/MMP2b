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
    unless is_member
      redirect_to @entry.activity.challenge, notice: 'You must be a member of this challenge.'
      return
    end
    if @entry.activity.goal < @entry.activity.amount + @entry.amount
      @entry.amount = @entry.activity.goal - @entry.activity.amount
    end

    if @entry.save
      redirect_to @entry.activity.challenge, notice: 'Entry was successfully confirmed.'
    else
      redirect_to @entry.activity.challenge, notice: 'Entry was NOT successfully confirmed.'
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:amount, :activity_id)
  end

  def is_member
    @requests = current_user.requests
    @requests.each do |request|
      if request.challenge == @entry.activity.challenge && request.confirmed
        return true
      end
    end
    false
  end
end
