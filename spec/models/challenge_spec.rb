# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Challenge, type: :model) do
  title = 'testtitle'
  description = 'foo bar text'
  toolongdescription = 'a'*241
  toolongtitle = 'a'*51
  password = 'foobar1'
  before{
    (@current_user=User.create(username: "user1", name: "user", password: password, password_confirmation: password))
  }

  describe "Create a new challange" do
    it('correct input') do
      c = Challenge.create(title: title, description: description, owner: @current_user)
      expect(c).to be_valid
    end
    it('no new challange without title') do
      c = Challenge.create(description: description, owner: @current_user)
      expect(c).to be_invalid
    end
    it('no new challange without owner') do
      c = Challenge.create(title: title, description: description)
      expect(c).to be_invalid
    end
    it('no new challange with too long description') do
      c = Challenge.create(title: title, description: toolongdescription, owner: @current_user)
      expect(c).to be_invalid
    end
    it('no new challange with too long title') do
      c = Challenge.create(title: toolongtitle, description: description, owner: @current_user)
      expect(c).to be_invalid
    end
  end
  
end
