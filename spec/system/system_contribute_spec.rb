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

        it "signup" do
            visit signup_path;
            fill_in 'user_username', with: 'Seppp'
            fill_in 'user_name', with: 'Sepp'
            fill_in 'user_password', with: '123456'
            fill_in 'user_password_confirmation', with: '123456'
            find('input[name="commit"]').click
            expect(current_path).to eq root_path
            expect(page).to have_content 'Log Out'
            expect(page).not_to have_content 'Log In'
        end
      end

    end