# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Request, type: :model) do
  password = 'foobar1'
  title = 'testtitle'
  description = 'foo bar text'
  before{
    (@current_user=User.create(username: "user1", name: "user", password: password, password_confirmation: password))
    (@owner=User.create(username: "user22", name: "user", password: password, password_confirmation: password))
    (@challenge=Challenge.create(title: title, description: description, owner: @owner))
  }

  describe "Create a new request" do
    it('correct input') do
      r = Request.create(user: @current_user, challenge: @challenge)
      expect(r).to be_valid
    end
    it('no new request without user') do
      r = Request.create(challenge: @challenge)
      expect(r).to be_invalid
    end
    it('no new request without challange') do
      r = Request.create(user: @current_user)
      expect(r).to be_invalid
    end
  end
end
