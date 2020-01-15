require_relative '../config/environment'
require_relative 'spec_helper'
require 'pry'

file_path = '../db/input/currency_sample.in.txt'
file = File.open(file_path)
file_data = File.read(file_path).split("\r\n")


describe "dataset class" do

    before(:each) do
        Dataset.all.clear
        DatasetGenerator.generate(file_data)
        @dataset1 = Dataset.all.first
        @dataset2 = Dataset.all.last
    end
    
    it "has appropriate set sizes" do
        expect(@dataset1.prices.length).to eq(2)
        expect(@dataset2.prices.length).to eq(3)       
    end
    
    it "correctly calculates prices in base terms" do
        expect(@dataset1.prices.first).to eq([4,0])
        expect(@dataset1.prices[1]).to eq([0,5])

        expect(@dataset2.prices[0]).to eq([15,5,1])
        expect(@dataset2.prices[1]).to eq([45,0,0])
        expect(@dataset2.prices[2]).to eq([15,50,0])
    end

    it "calculates the max sale in data set correctly" do
        expect(@dataset1.max_sale).to eq(1)
        expect(@dataset2.max_sale).to eq(44)
    end
    
    it "outputs information in correct format" do
        valid_output = "Dataset 1:\n1\nDataset 2:\n44\n"

        expect(Dataset.display).to eq(valid_output)
    end


end