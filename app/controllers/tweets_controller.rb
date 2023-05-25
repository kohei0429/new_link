class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  #index,showはmove_to_indexの対象から外す
  
  def index
    @tweets = Tweet.all
    # allメソッドを使用して、tweetsテーブルすべてのレコードをインスタンス変数に代入し、ビューに受け渡す
    # この@tweetsは、ビューファイルで使用できる
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
    params.require(:tweet).permit(:name, :image, :text)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
