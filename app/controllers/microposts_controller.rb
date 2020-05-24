class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :new, :create, :destroy]

  def create
    @post = current_user.microposts.build(micropost_params)
    if @post.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong"
      redirect_to root_url
    end
  end

  def show
    @post = Micropost.find(params[:id])
    @post.update(views: @post.views + 1)
  end

  def index
  end

  def new
    @post = Micropost.new
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "Micropost deleted"
    redirect_back fallback_location: root_path
  end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :topic, :content)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
