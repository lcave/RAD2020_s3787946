require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", mobile: "0400000000", password: "foobar", password_confirmation: "foobar")
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(title: "A Title", content: "Lorem ipsum")
    assert_difference "Micropost.count", -1 do
      @user.destroy
    end
  end
end
