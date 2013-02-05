require 'nokogiri'
require 'pry'
module Vapor
  class Crawler
    def games_for(user)
      doc = fetch("#{user.profile_url}games/")
      doc.gamesList.games.elements
    rescue NoMethodError => e
      if doc.gamesList.error.text =~ /profile is private/
        raise UserPrivateError, user.steam_id
      end
      raise e
    end
    private
    def fetch(url)
      doc = client.get(url, query: { xml: 1 }).body
      Nokogiri::Slop(doc)
    end
    def client
      @client ||= HTTPClient.new
    end
  end
  class UserPrivateError < RuntimeError
    def initialize(username)
      super("#{username} is private, cannot fetch games.")
    end
  end
end
