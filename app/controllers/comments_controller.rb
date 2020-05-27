class CommentsController < ApplicationController
  attr_accessor :commentable_id
  before_action :correct_user, only: :destroy

  def new
    @comment = Comment.new
  end

  def create
    find_commentable
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_back fallback_location: root_path
      count = @comment.get_parent_post.comment_count
      @comment.get_parent_post.update(comment_count: count + 1)
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    count = comment.get_parent_post.comment_count
    comment.get_parent_post.update(comment_count: count - comment.chain_count)
    comment.destroy
    flash[:success] = "Comment deleted"
    redirect_back fallback_location: root_path
  end

  private

  # Check whether current user is the same as the comment author
  def correct_user
    @comment = Comment.find_by_id(params[:id])
    @user = User.find_by_id(@comment.user_id)
    redirect_to(root_url) unless current_user?(@user)
  end

  # Define allowed parameters
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  # Find the object (post or comment) which this comment replies to 
  def find_commentable
    @commentable = Micropost.find_by_id(params[:comment][:micropost_id])
    if params[:comment][:comment_id]
      @commentable = Comment.find_by_id(params[:comment][:comment_id]) if params[:comment][:comment_id]
    end
  end
end
