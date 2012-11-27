require 'active_support/all'
require 'json'
module Vapor
  class API
    STEAM_API_KEY = ENV['STEAM_API_KEY']
    BASE_URL="http://api.steampowered.com"
    attr_reader :client

    def player_summaries_for(user)
      fetch('ISteamUser/GetPlayerSummaries', version: 'v0002', steamids: user.steam_id.to_s)
    end

    def client
      @client ||= HTTPClient.new
    end

    private
    def fetch(url, options)
      version = options.delete :version
      options.merge! key: STEAM_API_KEY
      response = client.get("#{BASE_URL}/#{url}/#{version}/?#{normalize_params options}")
      parse_and_extract_response response
    end

    def normalize_params(params)
      query = ""
      params.each {|k, v| query += "#{k}=#{v}&"}
      query
    end

    def parse_and_extract_response(response)
      JSON.parse(response.body)["response"]["players"].first.symbolize_keys
    end
  end
end
