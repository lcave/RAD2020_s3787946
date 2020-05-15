class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @posts = Micropost.all
  end
end
