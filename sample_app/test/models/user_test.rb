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

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    #list of emails that are good
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp allice+bob@baz.cn]
    valid_addresses do |valid_address|
      @user.email = valid_address
      #showing which email is wrong at this moment
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end
