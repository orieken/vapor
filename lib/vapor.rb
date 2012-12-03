require "vapor/version"
require 'vapor/api'
require 'vapor/crawler'
require 'vapor/user'
require 'vapor/game'
require 'vapor/games_list'

module Vapor
  def self.api
    @@api ||= Vapor::API.new
  end
end
