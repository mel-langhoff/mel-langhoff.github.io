require "./spec/spec_helper"

RSpec.describe Board do
    before :each do
        @board = Board.new
    end

    it "creates a board object" do        
        expect(@board).to be_an_instance_of(Board)
    end

    it "board attribute starts empty" do
        expect(@board.board).to be(nil)
    end

    it "is correct size" do
        @board.create_board    
        expect(@board.board.size).to eq 6
        expect(@board.board.first.size).to eq 7
    end

    it "displays board" do
        @board.create_board
        expect(@board.display_board).to be_a_kind_of(Array)
        expect(@board.display_board).to eq([[".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."]])
    end
end