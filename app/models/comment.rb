class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def parent
    post = Micropost.where(id: self.commentable_id).first
    if post
      if (post.comments.find_by_id(self.id) == self)
        @parent = post
      end
    else
      @parent = nil
    end
  end

  def get_parent_post
    parent_post = parent
    parent_post = Comment.find_by_id(self.commentable_id).get_parent_post if parent_post.nil?

    return parent_post
  end

  def get_replies
    replies = self.comments
  end

  def author_name
    if self.user_id == 0
      return "Deleted"
    else
      return User.find_by_id(self.user_id).name
    end
  end
end
