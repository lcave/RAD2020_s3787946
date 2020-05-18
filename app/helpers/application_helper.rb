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

  def setTopic(topic)
    session[:topic] = topic
  end
end
