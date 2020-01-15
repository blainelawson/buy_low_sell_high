require_relative '../config/environment'
require_relative 'spec_helper'

file_path = '../db/input/currency_sample.in.txt'
file_path2 = '../db/input/test2.in.txt'
file_data = File.read(file_path).split("\r\n")
file_data2 = File.read(file_path2).split("\r\n")


describe "dataset_generator" do
    it "DatasetGenerator.generate instanciates new dataset objects given input" do
        Dataset.new
        expect(Dataset.all.last).to be_an_instance_of Dataset
    end   
    
    it "generates the correct number of datasets per input" do
        Dataset.all.clear
        DatasetGenerator.generate(file_data)
        DatasetGenerator.generate(file_data2)
        expect(Dataset.all.length).to eq(5)
    end
end