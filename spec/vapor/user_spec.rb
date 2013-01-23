require 'spec_helper'
require 'vapor/user'

module Vapor
  describe User do
    it "raises a valid error when Steam API is not available", :vcr do
      expect { User.new("pedronascimento") }.to raise_error(Vapor::APINotAvailableError, "Steam API is currently unavailable")
    end
    it 'fetches the right Steam Id using the users webpage', :vcr do
      User.new("pedronascimento").steam_id.should == 76561198021477729
    end
    it 'extracts the correct id if user inputs a full url', :vcr do
      User.new("http://steamcommunity.com/id/pedronascimento").steam_id.should == 76561198021477729
    end

    context "invalid users", :vcr do
      it "raises a UserNotFoundError if user is not found" do
        expect{User.new('iafjflkjalkfjlk')}.to raise_error UserNotFoundError
      end
      it "raises an InvalidUsernameError if username has spaces" do
        expect{User.new('nao lembro')}.to raise_error InvalidUsernameError
      end
    end

    describe "profile info", :vcr do
      it "has a profile url" do
        User.new(76561198021477729).profile_url.should == "http://steamcommunity.com/id/pedronascimento/"
      end

    end
    describe "games", :vcr do
      let(:games) {User.new("pedronascimento").games}
      it "fetches the right amount of games" do
        games.count.should == 118
      end
    end
  end
end
