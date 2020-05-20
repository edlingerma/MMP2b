require 'rails_helper'

RSpec.describe "contibute to activity", type: :system do
    fixtures :challenges, :users, :activities, :entries
    before(:each, type: :system, js: true) do
        driven_by :selenium_chrome_headless
      end

      describe "show index" do
        
        it "show 2 challenges from fixtures" do
            visit root_path;
            expect(page).to have_content 'Challenge1'
            expect(page).to have_content 'Challenge2'
        end

        it "loads header styling" do
            visit root_path;
            expect(page).to have_css '.header'
        end

        it "show signup" do
            visit root_path;
            expect(page).to have_link 'Sign Up', href: signup_path
            expect(page).not_to have_link 'Log Out', href: logout_path
        end
      end

      describe "signup user" do
        it "go to signup" do
            visit root_path;
            click_link 'Sign Up'
            expect(current_path).to eq signup_path
        end

        it "signup redirect" do
            signup('Sppp', 'Password1')
            expect(current_path).to eq root_path
            expect(page).to have_content 'Log Out'
            expect(page).not_to have_content 'Log In'
        end
      end

    describe "join challenge" do
        before() do 
            signup('Sepp', 'Password1')
        end
        
        it "click challenge" do 
            find('.challenge_title', match: :first).click
            expect(current_path).to eq challenge_path(1)
            expect(page).to have_content 'Activity1'
            expect(page).to have_content 'Activity2'
        end
        
        it "join challenge" do
            visit challenge_path(1)
            expect(page).to have_button '.button'
            find('.button').click
            expect(page).not_to have_button '.button'
        end
    end

    describe "create and contribute to challenge" do
        before() do 
            signup('Seppl', 'Password1')
        end

        it "core feature" do
            click_link "New Challenge"
            expect(current_path).to eq new_challenge_path
            fill_in "challenge_title", with: 'Training'
            fill_in "challenge_description", with: 'Nicht sehr ausgewogen'
            expect(page).not_to have_content 'Goal'
            click_link "+"
            expect(page).to have_content 'Goal'
            fill_in  :with => 'Liegestütz', :placeholder =>'Activity title'
            fill_in :with => 10000, :placeholder =>'p.e. 1000' 
            find('input[name="commit"]').click
            expect(current_path).to eq challenge_path(3)
            find('input[name="commit"]', match: :last).click
            expect(current_path).to eq new_entry_path(3)
            fill_in 'enty_amount', with: 500
            find('input[name="commit"]').click
            expect(current_path).to eq challenge_path(3)


        end
    end
end