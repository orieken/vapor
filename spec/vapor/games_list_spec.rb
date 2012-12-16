require 'spec_helper'
module Vapor
  describe GamesList, :vcr do
    let(:user) { User.new(76561198021477729) }
    let(:games) {GamesList.new(user).games}
    it "has the right amount of games" do
      games.count.should == 109
    end
    it "creates game objects" do
      games.all?{|g| g.should be_a_kind_of Game}
    end
  end
end
