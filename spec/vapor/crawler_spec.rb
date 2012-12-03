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

  end
end
