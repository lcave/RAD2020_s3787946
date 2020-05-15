class StaticPagesController < ApplicationController
  def home
    @users = User.order(created_at: :asc).last(6)
  end
end
