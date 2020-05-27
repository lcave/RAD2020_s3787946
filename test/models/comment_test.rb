require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:foo)
    @micropost = microposts(:now)
    @comment = comments(:two)
    @reply = @comment.comments.build(body: "Reply to comment", user_id: @user.id)
    @reply.save
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should get parent post" do
    assert @reply.get_parent_post == @micropost
  end

  test "deleting parent should delete children" do
    assert_difference "Comment.count", -2 do
      @comment.destroy
    end
  end
end
