module SessionsHelper
  def log_in(user)
    user.update(last_login: Time.now)
    session[:user_id] = user.id
  end

  # Log out current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    current_user = nil
  end

  # Set current user variable
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

# Check if passed in user is current user
  def current_user?(user)
    user == current_user
  end

  # Check if a user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Create cookie for user
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Delete cookie for user
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Redirects to stored location (or to default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
