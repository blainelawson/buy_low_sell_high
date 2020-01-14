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
        self.all.each_with_index do |dataset, i|
            puts "Dataset #{i+1}:"
            puts dataset.max_sale
        end
    end

end
