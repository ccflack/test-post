class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    duplicate_check
    if @user.save
      redirect_to new_post_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def duplicate_check
    @users = User.all
    @users.each do |user|
      if @user.username == user.username
        @user.errors.add(:username, :duplicate, message: "This user already exists.")
      end
    end
  end


end
