require 'spec_helper'

describe Game do
    let(:game) {Game.new("2023/01/01", "2016/10/16", 4)}
    it "Game instance can be created" do
        expect(game).to be_instance_of(Game)
    end

    it "Game should return last palyed and number of max player" do
        name = "#{game.last_played_at}, #{game.multiplayer}"
        expect(name).to eq("2023/01/01, 4")
    end

    it "Game should have inheritance with item" do
        expect(game.publish_date).to eq("2016/10/16")
    end

    it "Game can't be archive since recently played" do
        expect(game.move_to_archive).to be_falsy
    end
end