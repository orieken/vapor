module Vapor
  class GamesList
    def initialize(user)
      @user = user
    end

    def games
      parse_games(fetch_games)
    end

    private
    def fetch_games
      Crawler.new.games_for(@user)
    end

    def parse_games(xml_nodes)
      @games ||= xml_nodes.map{|xml| Game.new(xml)}
    end
  end
end
