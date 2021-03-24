require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid info first flash" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: "", password: ""}}
    assert_template 'sessions/new'
    assert_not flash.empty?
  end

  test "login with invalid info no second flash" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: "", password: ""}}
    assert_template 'sessions/new'
    get root_path
    #after changing page there shouldn't be any flash
    assert flash.empty?
  end
end
