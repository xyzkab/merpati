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

  def is_url_shortened?(url)
    url =~ /https:\/\/t.co\/[0-9A-Za-z]+/ ? true : false
  end

  def expand_url(url)
    http = HTTP.get(url)
    http['location'] || url
  end
end
