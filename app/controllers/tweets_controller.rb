class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.save
    SendTweet.new(@tweet.tweet_text).perform
    redirect_to @tweet
    flash[:success] = "Tweet sent successfully!"
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet_text)
  end

end
