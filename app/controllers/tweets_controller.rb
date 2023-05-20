class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    # allメソッドを使用して、tweetsテーブルすべてのレコードをインスタンス変数に代入し、ビューに受け渡す
    # この@tweetsは、ビューファイルで使用できる
  end

  def new
    @tweet = Tweet.new
  end
end
