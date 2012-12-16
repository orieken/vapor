module Vapor
  class Game
    attr_reader :id, :name, :url, :time_spent_in_hours
    def initialize(xml_node)
      parse_xml(xml_node)
    end
    private
    def parse_xml(xml_node)
      @id = xml_node.search('appID').text.to_i
      @name = xml_node.search('name').text
      @url = xml_node.search('storeLink').text
      @time_spent_in_hours = xml_node.search('hoursOnRecord').text.to_f
    end
  end
end
