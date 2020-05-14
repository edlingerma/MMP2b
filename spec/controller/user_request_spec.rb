# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    password = 'password123'
    name = 'user'
    username = 'user1'

    describe "Create new user" do
        it "responds to html by default" do
            post :create, :params => { :user => { username: username, name: name, password: password, password_confirmation: password} }
            expect(response.media_type).to eq "text/html"
        end
        it "user is in the database" do
            expect { 
                post :create, :params => { :user => { username: username, name: name, password: password, password_confirmation: password } }
              }.to change { User.count }.by(1)
        end
    end

    describe 
end