module StaticPagesHelper
  def search(query, order)
    posts = Micropost.where("lower(content) LIKE lower(?) or lower(title) LIKE lower(?)",
                            "%#{params[:query]}%", "%#{params[:query]}%").order(order + " DESC").paginate(page: params[:page], per_page: 20)
  end

  def searchWithTopic(query, topic, order)
    posts = Micropost.where(topic: topic)
    posts = posts.where("lower(content) LIKE lower(?) or lower(title) LIKE lower(?)",
                            "%#{params[:query]}%", "%#{params[:query]}%").order(order + " DESC").paginate(page: params[:page], per_page: 20)
  end

  def topic
    return params[:topic] if params[:topic].present?
    return nil
  end

  def sort
    return params[:sort] if params[:sort].present?
    return nil
  end

  def query
        return params[:query] if params[:query].present?
    return nil
  end
end
