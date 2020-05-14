require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do

    describe "GET index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
          end 
        it "renders the my_challenges template" do
            get :my_challenges
            expect(response).to render_template("my_challenges")
        end
    end

    describe "GET my_challenges" do
        it "renders the my_challenges template" do
            get :my_challenges
            expect(response).to render_template("my_challenges")
        end
    end 
end