require 'rails_helper'

RSpec.describe "contibute to activity", type: :system do
    fixtures :challenges, :users
    before(:each, type: :system, js: true) do
        driven_by :selenium_chrome_headless
      end

      describe "show index" do
        it "show 2 challenges from fixtures" do
            visit root_path;
            expect(page).to have_content 'Challenge1'
            expect(page).to have_content 'Challenge2'
        end

      end
    end