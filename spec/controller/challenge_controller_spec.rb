require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do

    describe "GET index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
          end 
    end

    describe "GET show" do
        it "renders the show template" do
            get :show
            expect(response).to be_successful
        end
    end

    # TODO:  Als request spec niht als controller spec
    describe "GET my_challenges" do
        it "renders the my_challenges template" do
            get :my_challenges
            expect(response).to render_template("my_challenges")
        end
        it "displays only my challenges" do
            get :my_challenges
            expect(assigns(:challenges).length).to > Challenge.all.length
        end
    end 
end