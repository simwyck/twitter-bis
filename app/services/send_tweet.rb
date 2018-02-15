require 'twitter'

class SendTweet

  def initialize(tweet_text)
    #permet de faire passer le string en paramètre
    @tweet_text = tweet_text
  end

  def perform
    #exécute la/les tâche(s)
    log_in_to_twitter
    send_tweet
  end

  def log_in_to_twitter
    #permet de se login sur twitter avec tes credentials
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def send_tweet
    #envoie un tweet
    @client.update(@tweet_text)
  end

end
