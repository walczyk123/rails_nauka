require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testowy)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: {user: {name: "", email: "foo@inc", password: "foo", password_confirmation: "bar"}}
    print("return to edit page after unsuccessful edit: ")
    (assert_template "users/edit") ? print("OK\n") : print("ERR\n")
    print("empty flash message: . . . . . . . . . . . . ")
    (assert flash.empty?) ? print("OK\n") : print("ERR\n")
    print("error explanation: . . . . . . . . . . . . . ")
    (assert_select 'div#error_explanation') && (assert_select 'div.alert') ? print("OK\n") : print("ERR\n")
    print("good number of error explanation messages: . ")
    error_explanation_diff ? print("OK\n") : print("ERR\n")
  end

  # my tests : successful edit, flash message
  test "successful edit" do
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), params: {user: {name: "testowy_ed", email: "foo@inc.com", password: "foobar123", password_confirmation: "foobar123"}}
    follow_redirect!
    print("go to to user page after successful edit: . ")
    (assert_template "users/show") ? print("OK\n") : print("ERR\n")
    print("flash message:. . . . . . . . . . . . . . . ")
    (assert_not flash.empty?) ? print("OK\n") : print("ERR\n")
  end

  def error_explanation_diff
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "invalid@invalid", password: "elo", password_confirmation: "melo"}}
    end
  end
end

# rails test test/integration/users_edit_test.rb