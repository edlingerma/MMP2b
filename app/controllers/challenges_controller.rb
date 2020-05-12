class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :request_membership, :show_owner]
  before_action :logged_in, only: [:new, :request_membership, :my_challenges, :is_member, :is_owner]
  helper_method :is_owner, :is_member, :is_candidate

  # GET /challenges
  # GET /challenges.json
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

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @activities = @challenge.activities

    @activities_amount = []
    @activities.each_with_index do |activity, i|
      @activities_amount[i] = current_amount(activity)
      @activities_amount[i] /= activity.goal.to_f
    end
  end

  def show_owner
    if !is_owner
      redirect_to @challenge, notice: 'You must be the owner of this challenge.'
    end
    @requests = @challenge.requests
    @unconfirmed_requests = @requests.select do |request|
      !request.confirmed
    end
    @confirmed_requests = @requests.select do |request|
      request.confirmed && request.user != @challenge.owner
    end

    @entries = []
    activities = @challenge.activities
    activities.each do |activity|
      @entries.concat(activity.entries)
    end
    @entries = @entries.sort_by do |entry|
      entry.created_at
    end
    @entries.reverse!
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.owner = current_user
    Request.create(user: current_user, challenge: @challenge, confirmed: true)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET
  def request_membership
    @request = Request.create(challenge: @challenge, user: current_user)

    respond_to do |format|
      if @request
        format.html { redirect_to @challenge, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { redirect_to @challenge, notice: 'Request was NOT successfully created.' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def challenge_params
    params.require(:challenge).permit(:title, :description, activities_attributes: [:_destroy, :id, :title, :description, :goal, :unit])
  end

  def is_owner
    return current_user == @challenge.owner
  end

  def is_member
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
