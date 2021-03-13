require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "ziomek1", email: "ziom1@ziom.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
end
