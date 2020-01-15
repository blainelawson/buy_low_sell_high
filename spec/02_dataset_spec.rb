require_relative '../config/environment'
require_relative 'spec_helper'

file_path = '../db/input/currency_sample.in.txt'
file_path2 = '../db/input/test2.in.txt'
file_data1 = File.read(file_path).split("\r\n")
file_data2 = File.read(file_path2).split("\r\n")


describe "dataset class" do

    before(:each) do
        Dataset.all.clear
        DatasetGenerator.generate(file_data1)
        @dataset1 = Dataset.all[0]
        @dataset2 = Dataset.all[1]

        DatasetGenerator.generate(file_data2)
        @dataset3 = Dataset.all[2]
        @dataset4 = Dataset.all[3]
        @dataset5 = Dataset.all[4]
    end
    
    it "has appropriate set sizes" do
        expect(@dataset1.prices.length).to eq(2)
        expect(@dataset2.prices.length).to eq(3)
        expect(@dataset3.prices.length).to eq(4)
        expect(@dataset4.prices.length).to eq(2)
        expect(@dataset5.prices.length).to eq(3)
    end
    
    it "correctly calculates prices in base terms" do
        expect(@dataset1.prices.first).to eq([4,0])
        expect(@dataset1.prices[1]).to eq([0,5])

        expect(@dataset2.prices[0]).to eq([15,5,1])
        expect(@dataset2.prices[1]).to eq([45,0,0])
        expect(@dataset2.prices[2]).to eq([15,50,0])

        expect(@dataset3.prices[0]).to eq([24,108,8,7])
        expect(@dataset3.prices[1]).to eq([0,120,20,8])
        expect(@dataset3.prices[2]).to eq([24,36,0,1])
        expect(@dataset3.prices[3]).to eq([48,0,0,0])

        expect(@dataset4.prices[0]).to eq([8,2,1])
        expect(@dataset4.prices[1]) .to eq([16,20,9])

        expect(@dataset5.prices[0]).to eq([0,20,8])
        expect(@dataset5.prices[1]).to eq([12,8,1])
        expect(@dataset5.prices[2]).to eq([24,0,0])
    end

    it "calculates the max sale in data set correctly" do
        expect(@dataset1.max_sale).to eq(1)
        expect(@dataset2.max_sale).to eq(44)
        expect(@dataset3.max_sale).to eq(100)
        expect(@dataset4.max_sale).to eq(34)
        expect(@dataset5.max_sale).to eq(7)
    end
    
    it "outputs information in correct format" do
        valid_output = "Dataset 1:\n1\nDataset 2:\n44\nDataset 3:\n100\nDataset 4:\n34\nDataset 5:\n7\n"

        expect(Dataset.display).to eq(valid_output)
    end


end