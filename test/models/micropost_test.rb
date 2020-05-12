require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:foo)
    @micropost = @user.microposts.build(title: "A post", content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "title should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = ""
    assert_not @micropost.valid?
  end

  test "most recent post should be first" do
    assert_equal microposts(:now), Micropost.first
  end
end
