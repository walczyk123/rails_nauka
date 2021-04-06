require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout_links" do
    #main page - not logged in
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    #contact page
    get contact_path
    assert_select "title", full_title("Contact")
    #log in
    @user = users(:testowy)
    log_in_as(@user, remember_me: "0")
    #main page - logged in
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    get signup_path
    assert_select "title", full_title("Sign up")
    get users_path
    assert_select "title", full_title("All users")
  end
end
