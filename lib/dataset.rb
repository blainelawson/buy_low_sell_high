class Dataset
    @@all = []
    attr_accessor :prices

    def initialize  
        @prices = []
        @@all << self 
    end

    def min_price
        self.prices.minmax {|a,b| a.sum <=> b.sum }.first.sum
    end

    def high_price
        self.prices.minmax {|a,b| a.sum <=> b.sum }.last.sum
    end

    def max_sale
        self.high_price - self.min_price
    end    

    def self.all
        @@all
    end

    def self.display
        output = ""
        self.all.each_with_index do |dataset, i|
            output += "Dataset #{i+1}:\n#{dataset.max_sale}\n"
        end

        puts output

        output
    end

end
