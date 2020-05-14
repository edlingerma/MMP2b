require 'rails_helper'

RSpec.describe "Challenges", type: :request do
    it "request list of all challenges" do
      user = User.create(name:"test", password: "q", password_confirmation: "q", username: "usertest")
      challenge = Challenge.create(title: "Test Challenge", owner: user)
      get challenges_path
      expect(response).to be_successful
      expect(response.body).to include("Test Challenge")
    end

    it "request list of all challenges of user" do
        user = User.first
        challenge = Challenge.create(title: "Test Challenge", owner: user)
        get my_challenges_challenges_path
        expect(response).to be_successful
        expect(response.body).to include(challenge)
        expect(response.body).to eql(2)
    end
  end