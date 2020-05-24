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
      count = Micropost.find_by_id(params[:comment][:micropost_id]).comment_count
      Micropost.find_by_id(params[:comment][:micropost_id]).update(comment_count: count + 1)
    end
  end

  def destroy
    Comment.find_by_id(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

  private

  def correct_user
    @comment = Comment.find_by_id(params[:id])
    @user = User.find_by_id(@comment.user_id)
    redirect_to(root_url) unless current_user?(@user)
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
    @commentable = Micropost.find_by_id(params[:comment][:micropost_id])
    if params[:comment][:comment_id]
      @commentable = Comment.find_by_id(params[:comment][:comment_id]) if params[:comment][:comment_id]
    end
  end
end
