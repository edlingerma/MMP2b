# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Entry, type: :model) do
  fixtures :users, :activities
  amount = 10

  describe "Create a new entry" do
    it('correct input') do
      e = Entry.create(amount: amount, activity: activities(:one), user: users(:one))
      expect(e).to be_valid
    end
    it('no new entry without amount') do
      e = Entry.create(activity: activities(:one), user: users(:one))
      expect(e).to be_invalid
    end
    it('no new entry without activity') do
      e = Entry.create(amount: amount, user: users(:one))
      expect(e).to be_invalid
    end
    it('no new entry without user') do
      e = Entry.create(amount: amount, activity: activities(:one))
      expect(e).to be_invalid
    end
    it('no new entry with string in amount') do
      e = Entry.create(amount: 'foo', activity: activities(:one), user: users(:one))
      expect(e).to be_invalid
    end
  end
end
