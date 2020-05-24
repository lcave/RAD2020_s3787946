class StaticPagesController < ApplicationController
include StaticPagesHelper

  def home
    @users = User.all
    @topics = topics

    # If a sort paramater has been set, 
    # use that parameter to sort the collection of posts
    if sort
      order = sort
    else
      order = "created_at"
    end

    if query
      if topic
        @posts = searchWithTopic(query, topic, order)
      else
        @posts = search(query, order)
      end
    elsif topic
      @posts = Micropost.where(topic: topic).order(order + " DESC").paginate(page: params[:page], per_page: 20)
      
    else
      @posts = Micropost.order(order + " DESC").paginate(page: params[:page], per_page: 20)
    end
  end

end
