require "./spec/spec_helper.rb"

RSpec.describe Cell do
    before :each do
        @cell = Cell.new
    end

    it "exists" do
        expect(@cell).to be_an_instance_of Cell
    end

    it "starts with \'.\'" do
        expect(@cell.cell_value).to eq(".")
    end

    it "#empty?" do
        expect(@cell.cell_empty?).to be true
        @cell.cell_value = "X"
        expect(@cell.cell_empty?).to be false
    end
end