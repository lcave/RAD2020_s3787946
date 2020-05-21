class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @topics = topics
    params[:top_topics] = top_topics

    if (params[:sort].present?)
      order = params[:sort]
    else
      order = "created_at"
    end

    if params[:query].present?
      @posts = Micropost.where("lower(content) LIKE lower(?) or lower(title) LIKE lower(?)",
                               "%#{params[:query]}%", "%#{params[:query]}%").order(order + " DESC").paginate(page: params[:page], per_page: 20)
    elsif params[:topic].present?
      @posts = Micropost.where(topic: params[:topic]).order(order + " DESC").paginate(page: params[:page], per_page: 20)
    else
      @posts = Micropost.order(order + " DESC").paginate(page: params[:page], per_page: 20)
    end
  end
end
