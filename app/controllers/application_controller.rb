class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  before_action :set_topics

  def set_topics
    @hot_topics = top_topics
  end
end
