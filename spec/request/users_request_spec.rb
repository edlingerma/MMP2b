require 'rails_helper'

RSpec.describe "Challenges", type: :request do
    before{ 
        @u=User.create(name: "Any name", username: "test2", password: "1234567", password_confirmation: "1234567")
        @c= Challenge.create(title: "Test Challenge", owner: @u)
        Request.create(user: @u, challenge: @c, confirmed: true)
        @challenge2 = Challenge.create(title: "Test Challenge 2", owner: @u)
        @challenge3 = Challenge.create(title: "Test Challenge 3", owner: User.create(username: "test2", password:  "1234567", name: "t", password_confirmation: "1234567"))
        @challenge4 = Challenge.create(title: "AAAAA", owner: @u)
        post sessions_path(username: "test2", password:  "1234567") 
    }
    describe "test challenge actions" do
        
        let!(:user) {
         }
        
        it "GET index" do
        user = User.create(name:"test", password: "1234567", password_confirmation: "1234567", username: "usertest")
        challenge = Challenge.create(title: "Test Challenge", owner: user)
        get challenges_path
        expect(response).to be_successful
        expect(response.body).to include("Test Challenge")
        end

        # Seeding wird für tests benötigt
        it "GET my_challenges" do
            user = @u
            
            Request.create(user: user, challenge: @challenge2, confirmed: true)
            get my_challenges_challenges_path
            expect(response).to be_successful
            expect(response.body).to include(@c.title)
            expect(response.body).to include(@challenge2.title)
            expect(response.body).not_to include(@challenge3.title)
        end

        it "GET show" do
            activity= Activity.create(goal:100, challenge: @c, title: "nice Acticity")
            activity2= Activity.create(goal:100, challenge: @c, title: "nice Acticity ;)")
            activity3= Activity.create(goal:100, challenge: @challenges, title: "sad Acticity")
            get challenge_path(@c)
            expect(response).to be_successful
            expect(response.body).to include(activity.title)
            expect(response.body).to include(activity2.title)
            expect(response.body).not_to include(activity3.title)

        end

        it "GET show_owner" do
            get show_owner_challenge_path(@challenge2)
            expect(response).to be_successful
            get show_owner_challenge_path(@challenge3)
            expect(response).to be_redirect
        end

        it "POST create" do
            count_before= Challenge.count
            post challenges_path, :params => { :challenge => {  title: "New Challenge", owner: @u, description: "some description" } }
            expect(Challenge.count).to be > count_before
        end

        it "PUT update" do
            
            put "/challenges/#{@challenge4.id}",  :params => { :challenge => {title: "BBBBBB"}}
            get challenge_path(@challenge4)
            expect(response).to be_successful
            expect(response.body).to include("BBBBBB")
           
        end

        it "DELETE destroy" do
            count_before= Challenge.count
            delete challenge_path(@challenge3)
            expect(response).to be_redirect  # für abschluss von DELETE
        end

        it "GET request_membership" do
            count_before= Request.count
            equisiteChallenge = Challenge.create(title: "Best Challenge", owner: User.create(username: "test7", password:  "1234567", name: "t332323", password_confirmation: "1234567"))
            get request_membership_challenge_path(equisiteChallenge)
            expect(Request.count).to be > count_before
        end


    end
  end