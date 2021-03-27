require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "invalid@invalid", password: "elo", password_confirmation: "melo"}}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid signup information" do
    get signup_path
    assert_difference "User.count" do
      post users_path, params: {user: {name: "exampleuser",email: "example@exampl.com", password: "123123123", password_confirmation: "123123123"}}
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
    #assert_predicate flash[:error], :nil?
    assert is_logged_in?
  end
end
