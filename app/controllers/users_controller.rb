class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Verification.create!(name: @user.name, user_id: @user.id)
      flash[:success] = "Welcome to News+"
      log_in @user
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])

    @posts = Micropost.where(user_id: @user.id).paginate(page: params[:page], per_page: 20)
    @comments = Comment.where(user_id: @user.id).paginate(page: params[:page], per_page: 20)
    if @user == current_user
      ids = @comments.pluck(:id)
      @replies = Array.new
      @comments.each do |comment|
        comment.get_replies.each do |reply|
          @replies.push reply
        end
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :mobile, :bio, :gravatar, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
