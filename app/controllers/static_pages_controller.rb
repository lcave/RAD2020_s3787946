class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @topics = topics

    if (params[:sort].present?)
      order = params[:sort]
    else
      order = "created_at"
    end

    if params[:topic].present?
      @posts = Micropost.where(topic: params[:topic]).order(order + " DESC").paginate(page: params[:page], per_page: 20)
    else
      @posts = Micropost.order(order + " DESC").paginate(page: params[:page], per_page: 20)
    end
  end
end
