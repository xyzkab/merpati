module ActiveTweet
  module UrlHandling

    def shortened?(url)
      url =~ /https:\/\/t.co\/[0-9A-Za-z]+/ ? true : false
    end

    def expand_url(url)
      http = shortened?(url) ? HTTP.get(url) : { location: url }
      http[:location]
    end

    def get_url
      if self.class == Twitter::Entity::URI
        expand_url(expanded_uri.to_s)
      elsif self.class == Twitter::Media::Photo || self.class == Twitter::Media::AnimatedGif
        expand_url(media_uri.to_s)
      end
    end
  end
end
