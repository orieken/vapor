require 'nokogiri'
      require 'pry'
module Vapor
  class Crawler
    def games_for(user)
      doc = fetch("#{user.profile_url}games")
      doc.gamesList.games.elements
    end
    private
    def fetch(url)
      doc = client.get("#{url}?xml=1").body
      Nokogiri::Slop(doc)
    end
    def client
      @client ||= HTTPClient.new
    end
  end
end
