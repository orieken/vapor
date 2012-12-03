require "vapor/version"
require 'vapor/api'
require 'vapor/user'

module Vapor
  def self.api
    @@api ||= Vapor::API.new
  end
end
