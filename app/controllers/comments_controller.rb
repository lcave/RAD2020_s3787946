class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_back fallback_location: root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment][:comment_id]) if params[:comment][:comment_id]
    if params[:comment][:micropost_id]
      @commentable = Micropost.find_by_id(params[:comment][:micropost_id])
      @commentable.update(comment_count: +1)
    end
  end
end
