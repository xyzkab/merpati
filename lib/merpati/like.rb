require 'merpati/active_tweet'

module Merpati
  class Like

    extend ActiveTweet
    attr_reader :id, :title, :title, :description, :urls

    def initialize(id: nil, title:, description:, urls:)
      @id          = id
      @title       = title
      @urls        = urls
      @description = description
    end

    def self.all
      connection.favorites.map do |tweet|
        urls = (tweet.uris + tweet.media).map(&:get_url)
        new(id: tweet.id, title: tweet.text, description: tweet.full_text, urls: urls)
      end
    end

    def self.destroy(id)
      connection.unfavorite(id)
    end

    def destroy
      self.class.destroy(id)
    end
  end
end
