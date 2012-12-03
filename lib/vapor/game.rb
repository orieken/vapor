module Vapor
  class Game
    attr_reader :id, :name, :url, :time_spent
    def initialize(xml_node)
      @xml_node = xml_node
      parse_xml
    end
    private
    def parse_xml
      @id = @xml_node.search('appID').text.to_i
      @name = @xml_node.search('name').text
      @url = @xml_node.search('storeLink').text
      @time_spent = @xml_node.search('hoursOnRecord').text.to_f
    end
  end
end
