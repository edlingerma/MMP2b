class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :request_membership, :show_owner]
  before_action :logged_in, only: [:new, :request_membership, :my_challenges]
  helper_method :is_owner, :is_member, :is_candidate

  def index
    @challenges = Challenge.all
  end

  def my_challenges
    @challenges = Challenge.all
    @challenges = @challenges.select do |challenge|
      @challenge = challenge
      is_member
    end
  end

  def show
    @activities = @challenge.activities
  end

  def show_owner
    unless is_owner
      redirect_to @challenge, warning: 'You must be the owner of this challenge.'
    end

    @entries = @challenge.entries.sort_by(&:created_at).reverse!
  end

  def new
    @challenge = Challenge.new
  end

  def edit
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.owner = current_user
    Request.create(user: current_user, challenge: @challenge, confirmed: true)

    if @challenge.save
      redirect_to @challenge, success: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, success: 'Challenge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_url, success: 'Challenge was successfully deleted.'
  end

  def request_membership
    @request = Request.create(challenge: @challenge, user: current_user)

    if @request
      redirect_to @challenge, success: 'Request was successfully created.'
    else
      redirect_to @challenge, error: 'Oops, there was an error with your request. Please try again.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:title, :description, :avatar, activities_attributes: [:_destroy, :id, :title, :description, :goal, :unit])
  end

  def is_owner
    return false unless current_user

    current_user == @challenge.owner
  end

  def is_member
    return false unless current_user

    @requests = current_user.requests
    @requests.each do |request|
      if request.challenge == @challenge && request.confirmed
        return true
      end
    end
    false
  end

  def is_candidate 
    requests = @challenge.requests
    requests.each do |request|
      if request.user == current_user
        return true
      end
    end
    false
  end
end
