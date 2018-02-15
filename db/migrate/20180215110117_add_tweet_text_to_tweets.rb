class AddTweetTextToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :tweet_text, :string
  end
end
