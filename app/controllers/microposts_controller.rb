class MicropostsController < ApplicationController
  def create
  end

  def show
    @post = Micropost.find(params[:id])
    @post.update(views: +1)
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
end
