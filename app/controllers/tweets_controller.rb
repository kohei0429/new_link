class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  #index,showはmove_to_indexの対象から外す
  
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
    #includesメソッドを使用してN+1問題を解消
    #orderメソッドを使用してツイートを新しい順に取得
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
