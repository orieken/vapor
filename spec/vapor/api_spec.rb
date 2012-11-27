require 'spec_helper'
require 'vapor/api'

module Vapor
  describe API do
    let(:api) { Vapor::API.new }
    let(:user) { User.new(76561198021477729) }

    it 'fetches player summaries for an user', :vcr do
      api.player_summaries_for(user).should == {:steamid=>"76561198021477729", :communityvisibilitystate=>3, :profilestate=>1, :personaname=>"Lunks", :lastlogoff=>1353928831, :profileurl=>"http://steamcommunity.com/id/pedronascimento/", :avatar=>"http://media.steampowered.com/steamcommunity/public/images/avatars/4c/4c76064be169987500e4c7e228aabe3e33e1df47.jpg", :avatarmedium=>"http://media.steampowered.com/steamcommunity/public/images/avatars/4c/4c76064be169987500e4c7e228aabe3e33e1df47_medium.jpg", :avatarfull=>"http://media.steampowered.com/steamcommunity/public/images/avatars/4c/4c76064be169987500e4c7e228aabe3e33e1df47_full.jpg", :personastate=>1, :primaryclanid=>"103582791429521408", :timecreated=>1266769126, :loccountrycode=>"BR"}
    end
  end
end
