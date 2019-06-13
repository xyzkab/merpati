require 'merpati/active_tweet'

module Merpati
  class Like

    extend ActiveTweet
    attr_reader :title, :description, :urls

    def initialize(title:, description:, urls:)
      @title = title
      @description = description
      @urls  = urls
    end

    def self.all
      connection.favorites.map do |tweet|
        urls = (tweet.uris + tweet.media).map(&:get_url)
        new(title: tweet.text, description: tweet.full_text, urls: urls)
      end
    end    
  end
end
