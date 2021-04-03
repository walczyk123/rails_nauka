require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testowy)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), { params: { user: { name: "", email: "foo@inc", password: "foo", password_confirmation: "bar" } } }
    (assert_template "users/edit") ? @back_to_edit = "OK" : @back_to_edit = "ERR"
    (assert flash.empty?) ? @flash = "OK" : @flash = "ERR"
    (assert_select 'div#error_explanation') && (assert_select 'div.alert') ? @err_expl = "OK" : @err_expl = "ERR"
    error_explanation_diff ? @err_count = "OK" : @err_count = "ERR"
    unsuccessful_edit_test_results
  end

  # my tests : successful edit, flash message
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    name = "testowy_ed"
    email = "foo@inc.com"
    assert_template "users/edit"
    patch user_path(@user), { params: { user: { name: name, email: email, password: "foobar123", password_confirmation: "foobar123" } } }
    follow_redirect!
    (assert_template "users/show") ? @go_to_users = "OK" : @go_to_users = "ERR"
    (assert_not flash.empty?) ? @flash2 = "OK" : @flash2 = "ERR"
    @user.reload
    (assert_equal name, @user.name) && (assert_equal email, @user.email) ? @user_data = "OK" : @user_data = "ERR"
    successful_edit_test_results
  end

  private

  def error_explanation_diff
    assert_no_difference 'User.count' do
      post users_path, { params: { user: { name: "", email: "invalid@invalid", password: "elo", password_confirmation: "melo" } } }
    end
  end

  def unsuccessful_edit_test_results
    puts("=== unsuccessful user edit test ===")
    print("back to edit page after unsuccessful edit: . #{@back_to_edit}\n")
    print("empty flash message: . . . . . . . . . . . . #{@flash}\n")
    print("error explanation: . . . . . . . . . . . . . #{@err_expl}\n")
    print("good number of error explanation messages: . #{@err_count}\n")
  end

  def successful_edit_test_results
    puts("=== successful user edit test ===")
    print("go to to user page after successful edit:. . #{@go_to_users}\n")
    print("flash message: . . . . . . . . . . . . . . . #{@flash2}\n")
    print("correctly updated user data: . . . . . . . . #{@user_data}\n")
  end
end

# rails test test/integration/users_edit_test.rb