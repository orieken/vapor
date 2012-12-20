require 'spec_helper'

module Vapor
  describe Crawler do
    let(:user) { User.new(76561198021477729) }
    let(:crawler) {Crawler.new}

    describe "#games_for", :vcr do
      it "fetches a games list for an user" do
        crawler.games_for(user).count.should == 109
      end
    end
    it "raises a UserPrivateError if user is private", :vcr do
        expect{crawler.games_for(User.new("ggleytonb"))}.to raise_error(UserPrivateError)
    end

  end
end
