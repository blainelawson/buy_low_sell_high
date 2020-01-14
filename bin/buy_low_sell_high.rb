require_relative "../config/environment"

file_path = '../db/input/currency_sample.in.txt'
file = File.open(file_path)
file_data = File.read(file_path).split("\r\n")

Dataset.generate(file_data)

Dataset.display


