require 'rails_helper'

RSpec.describe SessionsController, type: :request do

    let!(:user) { User.create(name: "Any name", username: "anyname", password: "password123", password_confirmation: "password123") }

    describe "Log in: Create new session" do
       
        it "Invalid password" do
            post sessions_path, :params => {  username: "anyname", password: "564651"  }
            expect(flash[:alert]).to match("Username or password is invalid")
            expect(sessions_path).to render_template("new")
        end

        it "password and username correct" do
            post sessions_path , :params => { username: "anyname", password: "password123" }
            expect(flash[:info]).to match("Logged in!")
            should redirect_to root_url
        end
    end

    describe "Log out: Destroy session" do
        it "log the current user out" do
            delete session_path('1')
            expect(flash[:info]).to match("You are logged out now.")
            should redirect_to root_url
        end
    end
end