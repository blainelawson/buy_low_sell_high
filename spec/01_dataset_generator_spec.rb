require_relative '../config/environment'
require_relative 'spec_helper'
require 'pry'

file_path = '../db/input/currency_sample.in.txt'
file = File.open(file_path)
file_data = File.read(file_path).split("\r\n")


describe "dataset_generator" do
    it "DatasetGenerator.generate instanciates new dataset objects given input" do
        Dataset.new
        expect(Dataset.all.last).to be_an_instance_of Dataset
    end            
end