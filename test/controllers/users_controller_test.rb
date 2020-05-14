# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, params: { user: { name: @user.name, password: @user.password, password_confirmation: @user.password, username: "2" } }
    end

    assert_redirected_to root_path
  end
end
