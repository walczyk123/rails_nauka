require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testowy)
  end

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

  test "login with valid information" do
    get login_path
    post login_path, params: {session: { email: @user.email, password: "password"}}
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count:0 #login path disappears after login and redirect?
    assert_select "a[href=?]", logout_path # logout and user path appears after login?
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with valid information then logout" do
    get login_path
    post login_path, params: {session: { email: @user.email, password: "password"}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count:0 #login path disappears after login and redirect?
    assert_select "a[href=?]", logout_path # logout and user path appears after login?
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user),count: 0 #no logout path and logged user after logout
  end

  test "login with valid information then logout in one of few tabs" do
    get login_path
    post login_path, params: {session: { email: @user.email, password: "password"}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count:0 #login path disappears after login and redirect?
    assert_select "a[href=?]", logout_path # logout and user path appears after login?
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    #user logout in one tab
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user),count: 0 #no logout path and logged user after logout
  end

end

# rails test test/integration/users_login_test.rb
