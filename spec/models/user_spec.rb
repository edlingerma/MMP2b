# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require('rails_helper')
RSpec.describe(User, type: :model) do
  password = 'foobar1'

  describe "Create new user with missing input" do
    it('no new user without username') do
      u = User.create(name: 'user', password: password, password_confirmation: password)
      expect(u).to be_invalid
    end
    it('no new user with existing username') do
      u = User.create(username: 'User1', name: 'user', password: password, password_confirmation: password)
      expect(u).to be_invalid
    end
    it('no new user without password') do
      u = User.create(username: 'user2', name: 'user')
      expect(u).to be_invalid
    end
    it('no new user with wrong password confirmation') do
      u = User.create(username: 'user2', name: 'user', password: password, password_confirmation: 'barfoo')
      expect(u).to be_invalid
    end
    it('no new user without name') do
      u = User.create(username: 'user2', password: password, password_confirmation: password)
      expect(u).to be_invalid
    end
    it('new user with new username and valid password can be created') do
      u = User.create(username: 'user2', name: 'user', password: password, password_confirmation: password)
      expect(u).to be_valid
    end
  end

  describe "Create new user with invalid input (too long/short)" do
    toolongstring = 'a' * 51
    it('too long username') do
      u = User.create(username: toolongstring, name: 'user', password: password, password_confirmation: password)
      expect(u).to be_invalid
    end
    it('too long name') do
      u = User.create(username: 'user3', name: toolongstring, password: password, password_confirmation: password)
      expect(u).to be_invalid
    end
  end
end
