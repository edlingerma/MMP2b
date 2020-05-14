# frozen_string_literal: true

require('rails_helper')
RSpec.describe(Activity, type: :model) do
  title = 'testtitle'
  description = 'foo bar text'
  toolongdescription = 'a'*351
  goal = 100
  password = 'foobar1'
  before{
    (@current_user=User.create(username: "user1", name: "user", password: password, password_confirmation: password))
    (@challenge=Challenge.create(title: title, description: description, owner: @current_user))
  }
  
  describe "Create a new activity" do
    it('correct input') do
        a = Activity.create( title: title, description: description, goal: goal, challenge: @challenge)
        expect(a).to be_valid
    end
    it('no new activity without goal') do
        a = Activity.create( title: title, description: description, challenge: @challenge)
        expect(a).to be_invalid
    end  
    it('no new activity without title') do
      a = Activity.create( description: description, goal: goal, challenge: @challenge)
      expect(a).to be_invalid
    end 
    it('no new activity with string as goal') do
      a = Activity.create( title: title, description: description, goal: 'foo', challenge: @challenge)
      expect(a).to be_invalid
    end
    it('no new with too long description') do
      a = Activity.create( title: title, description: toolongdescription, goal: goal, challenge: @challenge)
      expect(a).to be_invalid
    end
  end
end
