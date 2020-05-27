require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar" } }
    end
    assert_template "users/new"
    assert_select "div#error_explanation"
  end

  test "valid signup information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: {name: "Foo Bar",
                                        email: "foo@bar.com",
                                        mobile: "0123456789",
                                        password: "password",
                                        password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template "/"
    assert flash[:success]
  end
end
