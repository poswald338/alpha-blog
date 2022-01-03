require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest
  test "get signup form and create user" do
    get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: "username", email: "test@test.com", password: "password"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "username", response.body
  end

  test "get signup form and reject invalid signup submission" do
    get '/signup'
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: {user: {username: "", email: "test@test.com", password: "password"}}
    end
    assert_match 'errors', response.body
  end
end
  
