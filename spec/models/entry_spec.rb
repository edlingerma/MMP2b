# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Entry, type: :model) do

  amount = 10
  password = 'foobar1'
  title = 'testtitle'
  description = 'foo bar text'
  before{
    (@current_user=User.create(username: "user1", name: "user", password: password, password_confirmation: password))
    (@challenge=Challenge.create(title: title, description: description, owner: @current_user))
    (@activity=Activity.create(title: title, description: description, goal: 100, challenge: @challenge))
  }

  describe "Create a new entry" do
    it('correct input') do
      e = Entry.create(amount: amount, activity: @activity, user: @current_user)
      expect(e).to be_valid
    end
    it('no new entry without amount') do
      e = Entry.create(activity: @activity, user: @current_user)
      expect(e).to be_invalid
    end
    it('no new entry without activity') do
      e = Entry.create(amount: amount, user: @current_user)
      expect(e).to be_invalid
    end
    it('no new entry without user') do
      e = Entry.create(amount: amount, activity: @activity)
      expect(e).to be_invalid
    end
    it('no new entry with string in amount') do
      e = Entry.create(amount: 'foo', activity: @activity, user: @current_user)
      expect(e).to be_invalid
    end
  end
end
