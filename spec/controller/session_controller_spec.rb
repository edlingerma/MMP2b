require 'rails_helper'

RSpec.describe SessionsController, type: :request do

    # let(:valid_attributes) {
    #     { :title => "Test title!", :description => "This is a test description", :status => "draft" }
    # }
    describe "Create new session" do

        let!(:user) { User.create(name: "Any name", password: "1", password_confirmation: "1") }
            
        # before(:each) do
        #     post :create, :params => { :user => { :id => 1, :name => "Any Name", :password => "1", :password_confirmation => "1", username: "1" } }
        # end

        it "Invalid password" do
            post  sessions_path , :params => {  username: "Any Name", password: "564651"  }
            should set_the_flash[:alert].to('Username or password is invalid')
        end

        it "password is ok" do
            post  sessions_path  , :params => { username: "Any Name", password: "1" }
            should respond_with(:redirect)
            should redirect_to(root_url)
        end
    end
end