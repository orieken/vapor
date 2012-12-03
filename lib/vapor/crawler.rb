require 'nokogiri'
      require 'pry'
module Vapor
  class Crawler
    def games_for(user)
      doc = client.get("#{user.profile_url}games?xml=1").body
      Nokogiri::Slop(doc).gamesList.games.elements
    end
    private
    def client
      @client ||= HTTPClient.new
    end
  end
end
