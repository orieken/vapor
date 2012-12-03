require 'httpclient'
require 'rexml/document'
require 'vapor/api'
module Vapor
  class User
    attr_reader :steam_id

    def initialize(steam_id)
      if steam_id.is_a? Integer || steam_id =~ /\A\d+\Z/
        @steam_id = steam_id
      else
        @steam_id = fetch_real_id steam_id
      end
      @steam_id = @steam_id.to_i
    end

    private
    def fetch_real_id(username)
      user_page = client.get("http://steamcommunity.com/id/#{username}?xml=1")
      raise APINotAvailableError if user_page.status == 503
      REXML::Document.new(user_page.body).elements['profile/steamID64'].text
    end

    def client
      @client ||= HTTPClient.new
    end
  end
end
