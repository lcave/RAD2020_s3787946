require "test_helper"

class UserCommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:foo)
    @micropost = microposts(:now)
  end

  test "Micropost comment count should increase" do
    count = @micropost.comment_count
    post comments_url, params: { comment: { user_id: @user.id, body: "Test", micropost_id: @micropost.id } }
    assert @micropost.reload.comment_count == count + 1
  end
end
