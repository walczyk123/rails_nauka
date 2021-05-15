require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout_links" do

    main_page_logged_out
    main_page_logged_in
  end

#  =================== private ==============
  private

  def main_page_logged_out
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  def main_page_logged_in
    @user = users(:testowy)
    log_in_as(@user, remember_me: "0")
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path, count: 0
    assert_match @user.followers.count.to_s, response.body
    assert_match @user.following.count.to_s, response.body
  end
end
