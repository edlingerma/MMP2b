# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Challenge, type: :model) do
  fixtures :users
  title = 'testtitle'
  description = 'foo bar text'
  toolongdescription = 'a' * 241
  toolongtitle = 'a' * 51

  describe "Create a new challenge" do
    it('correct input') do
      c = Challenge.create(title: title, description: description, owner: users(:one))
      expect(c).to be_valid
    end
    it('no new challenge without title') do
      c = Challenge.create(description: description, owner: users(:one))
      expect(c).to be_invalid
    end
    it('no new challenge without owner') do
      c = Challenge.create(title: title, description: description)
      expect(c).to be_invalid
    end
    it('no new challenge with too long description') do
      c = Challenge.create(title: title, description: toolongdescription, owner: users(:one))
      expect(c).to be_invalid
    end
    it('no new challenge with too long title') do
      c = Challenge.create(title: toolongtitle, description: description, owner: users(:one))
      expect(c).to be_invalid
    end
  end
end
