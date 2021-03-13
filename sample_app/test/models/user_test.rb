require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "ziomek1", email: "ziom1@ziom.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
