require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:testowy)
    @non_admin = users(:bigboy)
  end

  test"index including pagination" do
    log_in_as(@admin)
    get users_path
    assert_template'users/index'
    assert_select'div.pagination', count: 2
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select'a[href=?]', user_path(user),text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user),text:'Delete'
      end
    end
    assert_difference "User.count", -1 do
      delete user_path(@non_admin)
    end
  end

end
