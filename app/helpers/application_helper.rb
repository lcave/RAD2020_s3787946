module ApplicationHelper
  def full_title(page_title = "")
    base_title = "News+"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def topics
    topics = ["News", "A.I.", "V.R.", "RMIT", "Game", "Rails", "Go", "Web", "M.L", "Joke", "React", "Vue", "Node", "iOS", "AWS"]
  end

  def top_topics
    topics_with_views = Hash.new
    topics.each do |topic|
      topics_with_views[topic] = getViews(topic)
    end
    topics_with_views = topics_with_views.sort_by { |k, v| v }.reverse
    return topics_with_views
  end

  def setTopic(topic)
    session[:topic] = topic
  end

  private

  def getViews(topic)
    post_views = Micropost.where(topic: topic).pluck(:views)
    views = 0
    post_views.each do |post_view|
      views += post_view
    end
    return views
  end
end
