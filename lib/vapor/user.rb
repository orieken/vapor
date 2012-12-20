require 'httpclient'
require 'rexml/document'
module Vapor
  class User
    attr_reader :steam_id

    def initialize(steam_id)
      if steam_id =~ /steamcommunity\.com/
        steam_id = steam_id.match(/\/id\/(\w+)/)[1]
      end
      raise(InvalidUsernameError, steam_id) if steam_id =~ / /
      if steam_id.is_a? Integer || steam_id =~ /\A\d+\Z/
        @steam_id = steam_id
      else
        @steam_id = fetch_real_id steam_id
      end
      @steam_id = @steam_id.to_i
    end

    def profile_url
      @profile_url ||= player_info[:profileurl]
    end

    def games
      @games ||= GamesList.new(self).games
    end

    private

    def player_info
      @player_info ||= Vapor.api.player_summaries_for(self)
    end

    def fetch_real_id(username)
      user_page = client.get("http://steamcommunity.com/id/#{username}?xml=1")
      raise APINotAvailableError if user_page.status == 503
      if id = REXML::Document.new(user_page.body).elements['profile/steamID64']
        id.text
      else
        raise UserNotFoundError, username
      end
    end

    def client
      Vapor.api.client
    end
  end

  class UserNotFoundError < RuntimeError
    def initialize(username)
      super("#{username} does not appear to be a valid Steam ID.")
    end
  end
  class InvalidUsernameError < RuntimeError
    def initialize(username)
      super("#{username} is an invalid username.")
    end
  end
end
