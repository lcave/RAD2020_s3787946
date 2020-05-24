class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  before_action :set_topics

  # Return an array of topics sorted by views
  def set_topics
    @hot_topics = top_topics
  end
end
