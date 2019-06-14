require 'merpati/active_tweet/url_handling'

module ActiveTweet
  def connection
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def find(id)
    connection.status(id)
  end
end

Twitter::Entity::URI.include(ActiveTweet::UrlHandling)
Twitter::Media::Photo.include(ActiveTweet::UrlHandling)
Twitter::Media::AnimatedGif.include(ActiveTweet::UrlHandling)
