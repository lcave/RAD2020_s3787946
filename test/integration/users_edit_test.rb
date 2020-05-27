require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:foo)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    patch user_path(@user), params: { user: { name: "", email: "foo@invalid", mobile: nil,
                                             bio: nil, gravatar: nil, password: "foo",
                                             password_confirmation: "bar" } }
    follow_redirect!
    assert_template "/"
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    mobile = "0400000000"
    patch user_path(@user), params: { user: { name: name, email: email, mobile: mobile, password: "", password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "unsuccessfull edit wrong user" do
    wrongUser = users(:bar)
    log_in_as(wrongUser)
    get edit_user_path(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    mobile = "0400000000"
    patch user_path(@user), params: { user: { name: name, email: email, mobile: mobile, password: "", password_confirmation: "" } }
    assert_redirected_to root_path
    assert flash[:failure]
  end
end
