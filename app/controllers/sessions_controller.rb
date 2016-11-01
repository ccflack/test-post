class SessionsController < ApplicationController

  before_action :forbid_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(
                  username: params[:session][:username]
                )
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to :root
        flash[:success] = "Welcome #{user.username}"
      else
        flash[:warning] = "Your password is incorrect."
        render :new
      end
    else
      flash[:warning] = "No account found with that name. Would you like to <a href='/signup/'>create an account</a>?".html_safe
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been loggged out."
    redirect_to :root
  end

end
