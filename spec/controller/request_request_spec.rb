# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

require 'rails_helper'

RSpec.describe RequestsController, type: :request do

    password = 'foobar1'
    title = 'testtitle'
    description = 'foo bar text'
    before{
        (@current_user=User.create(username: "user1", name: "user", password: password, password_confirmation: password))
        (@owner=User.create(username: "user22", name: "user", password: password, password_confirmation: password))
        (@challenge=Challenge.create(title: title, description: description, owner: @owner))
        (@request = Request.create(user: @current_user, challenge: @challenge))
      }

    describe "Requests" do
       
        it "accept" do
            get accept_request_path(@request)
            should redirect_to show_owner_challenge_path(@challenge)
        end

        it "reject" do
            get reject_request_path(@request)
            should redirect_to show_owner_challenge_path(@challenge)
        end
    end
end