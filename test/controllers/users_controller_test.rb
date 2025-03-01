require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:foo)
    @user2 = users(:bar)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@user2)
    get edit_user_path(@user)
    assert_redirected_to root_url
  end
  test "should redirect update when logged in as wrong user" do
    log_in_as(@user2)
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email } }
    assert_redirected_to root_url
  end
end
