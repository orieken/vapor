module Vapor
  class GamesList
    def initialize(xml_nodes)
      @xml_nodes = xml_nodes
    end

    def games
      @games ||= @xml_nodes.map{|xml| Game.new(xml)}
    end
  end
end
