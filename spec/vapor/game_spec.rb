require 'spec_helper'
module Vapor
  describe Game, :vcr do
    let(:user) { User.new(76561198021477729) }
    let (:game) {GamesList.new(user).games.first}
    it "finds the correct id" do
      game.id.should == 570
    end
    it "finds the correct name" do
      game.name.should == "Dota 2"
    end
    it "finds the correct id" do
      game.url.should == "http://steamcommunity.com/app/570"
    end
    it "finds the correct time spent in hours" do
      game.time_spent_in_hours.should == 68.5
    end
  end
end
