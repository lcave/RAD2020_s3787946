class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully logged in, welcome " + user.name
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    log_out
    flash[:warning] = "Logged out"
    redirect_to root_path
  end
end
