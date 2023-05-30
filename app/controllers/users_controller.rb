class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = current_user.name
    @tweets = current_user.tweets
  end

  private

  def set_user
    @user = User.find([:id])
  end
  
end
