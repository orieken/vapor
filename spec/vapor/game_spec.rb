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
    it "finds the correct id" do
      game.time_spent.should == 44.6
    end
  end
end
