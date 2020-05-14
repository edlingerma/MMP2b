require 'rails_helper'

RSpec.describe "Challenges", type: :request do

    describe "test challenge actions" do
        
        let!(:user) { User.create(name: "Any name", username: "anyname", password: "1", password_confirmation: "1")
        post sessions_path(username: "anyname", password:  "1") }
        
        it "request list of all challenges" do
        user = User.create(name:"test", password: "q", password_confirmation: "q", username: "usertest")
        challenge = Challenge.create(title: "Test Challenge", owner: user)
        get challenges_path
        expect(response).to be_successful
        expect(response.body).to include("Test Challenge")
        end

        # Seeding wird für tests benötigt
        it "request list of all challenges of user" do
            user = User.first
            challenge1 = Challenge.create(title: "Test Challenge", owner: user)
            challenge2 = Challenge.create(title: "Test Challenge 2", owner: user)
            post sessions_path(user.username, user.password)
            get my_challenges_challenges_path
            expect(response.body).to include(challenge.title)
            expect(response.body).to include(challenge2.title)
        end
    end
  end