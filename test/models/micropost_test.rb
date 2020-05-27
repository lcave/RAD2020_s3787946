require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:foo)
    @micropost = microposts(:now)
    @comment = comments(:two)
    @reply = @comment.comments.build(body: "Reply to comment", user_id: @user.id)
    @reply.save
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

  test "Micropost should be created" do
    assert_difference "Micropost.count", 1 do
      post = Micropost.create!(title: "test",
                               user_id: ActiveRecord::FixtureSet.identify(:foo),
                               content: "Lorem ipsum")
    end
  end

  test "Micropost should be deleted" do
    assert_difference "Micropost.count", -1 do
      @micropost.destroy
    end
  end

  test "deleting post should delete comments" do
    assert_difference "Comment.count", -2 do
      @micropost.destroy
    end
  end
end
