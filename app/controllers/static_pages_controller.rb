class StaticPagesController < ApplicationController
  def home
    @users = User.all
    if (params[:sort] == "views")
      @posts = Micropost.order(views: :desc).paginate(page: params[:page], per_page: 20)
    elsif (params[:sort] == "comments")
      @posts = Micropost.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
    else
      @posts = Micropost.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
    end
  end
end
