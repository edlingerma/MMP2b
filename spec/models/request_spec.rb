# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Request, type: :model) do
  fixtures :users, :challenges

  describe "Create a new request" do
    it('correct input') do
      r = Request.create(user: users(:two), challenge: challenges(:one))
      expect(r).to be_valid
    end
    it('no new request without user') do
      r = Request.create(challenge: challenges(:one))
      expect(r).to be_invalid
    end
    it('no new request without challenge') do
      r = Request.create(user: users(:one))
      expect(r).to be_invalid
    end
  end
end
