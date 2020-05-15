class MicropostsController < ApplicationController
  def create
  end

  def show
    @post = Micropost.find(params[:id])
    @post.update(views: @post.views + 1)
  end
end
