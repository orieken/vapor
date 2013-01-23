require 'spec_helper'
module Vapor
  describe Game, :vcr do
    let(:user) { User.new(76561198021477729) }
    let (:game) {GamesList.new(user).games.first}
    it "finds the correct id" do
      game.id.should == 630
    end
    it "finds the correct name" do
      game.name.should == "Alien Swarm"
    end
    it "finds the correct id" do
      game.url.should == "http://steamcommunity.com/app/630"
    end
    it "finds the correct time spent in hours" do
      game.time_spent_in_hours.should == 1.3
    end
  end
end
