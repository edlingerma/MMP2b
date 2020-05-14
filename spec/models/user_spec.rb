# frozen_string_literal: true

require('rails_helper')
RSpec.describe(User, type: :model) do
  let!(:user) { User.create(username: "user1", name: "user", password: "1", password_confirmation: "1") }
  password = 'foo'

  it('no new user without username') do
    u = User.create( name: 'user', password: password, password_confirmation: password)
    expect(u).to be_invalid
  end
  it('no new user with existing username') do
    u = User.create(username: 'user1', name: 'user', password: password, password_confirmation: password)
    expect(u).to be_invalid
  end
  it('no new user without password') do
    u = User.create(username: 'user2', name: 'user')
    expect(u).to be_invalid
  end
  it('no new user with wrong password confirmation') do
    u = User.create(username: 'user2', name: 'user', password: password, password_confirmation: 'bar')
    expect(u).to be_invalid
  end
  it('no new user without name') do
    u = User.create(username: 'user2', password: password, password_confirmation: password)
    expect(u).to be_invalid
  end
  it('new user with new username and valid password can be created') do
    u = User.create( username: 'user2', name: 'user', password: password, password_confirmation: password)
    expect(u).to be_valid
  end
end
