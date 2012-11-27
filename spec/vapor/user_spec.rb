require 'spec_helper'
require 'vapor/user'

module Vapor
  describe User do
    it "instantiates an user with required info" do
      User.new(12345678).should be_a_kind_of Vapor::User
    end
    it "raises a valid error when Steam API is not available", :vcr do
      expect{User.new("pedronascimento")}.to raise_error(Vapor::APINotAvailableError, "Steam API is currently unavailable")
    end
    it 'fetches the right Steam Id using the users webpage', :vcr do
      User.new("pedronascimento").steam_id.should == 76561198021477729
    end
  end
end
