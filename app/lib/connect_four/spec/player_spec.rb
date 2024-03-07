require "./spec/spec_helper"

RSpec.describe Player do
    before :each do
        @computer = Player.new("Computer", "O")
    end

    it "creates a player object" do        
        expect(@computer).to be_an_instance_of(Player)
    end

    it "has name and token" do   
        expect(@computer.player_name).to eq("Computer")
        expect(@computer.token).to eq("O")
    end
end