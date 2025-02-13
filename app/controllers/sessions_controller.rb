class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !user
      user = User.find_by(name: params[:session][:email])
    end
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      flash[:success] = "Successfully logged in, welcome " + user.name
      redirect_back_or root_url
    else
      flash.now[:danger] = "Invalid email/username or password"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    flash[:warning] = "Logged out"
    redirect_to root_url
  end
end
