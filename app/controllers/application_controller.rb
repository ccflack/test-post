class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :require_login, :forbid_login

  private

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def logged_out?
    !current_user
  end

  def require_login
    flash[:warning] = "You must be logged in to do that!"
    redirect_to login_path if logged_out?
  end

  def forbid_login
    flash[:warning] = "You're already logged in!"
    redirect_to root_path if logged_in?
  end

end
