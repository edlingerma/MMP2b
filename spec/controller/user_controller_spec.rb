require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description", :status => "draft" }
    }
    describe "Create new user" do
        it "responds to html by default" do
            post :create, :params => { :user => { :name => "Any Name", :password => "1", :password_confirmation => "1", username: "1" } }
            expect(response.media_type).to eq "text/html"
        end
        it "user is in the database" do
            expect { 
                post :create, :params => { :user => { :name => "Any Name", :password => "1", :password_confirmation => "1", username: "1" } }
              }.to change { User.count }.by(1)
        end
    end

    describe 
end