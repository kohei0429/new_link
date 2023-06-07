class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @tweets = user.tweets
  end

  private

  def set_user
    @user = User.find([:id])
  end
  
end
