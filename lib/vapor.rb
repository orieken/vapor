require "vapor/version"
require 'vapor/api'
require 'vapor/user'
require 'vapor/crawler'

module Vapor
  def self.api
    @@api ||= Vapor::API.new
  end
end
