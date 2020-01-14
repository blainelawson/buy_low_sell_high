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

    def self.generate(file_data)
        datasets_amt = file_data[0].to_i # indicates number of sets (useable for tests)

        # initialize dataset start point
        start_index = 1
        end_index = file_data[1].split(" ").last.to_i + 2 # +1 for currency multiplier row and initial set number row

        # now I need to find first dataset's denoms and prices--this is repeatable and also lets me know how many 
        # rows of data are in each set--what index to start the process on again.
        # should I put this in a DatasetGenerator class?

        datasets_amt.times do
            @item = self.new

            denoms = file_data[start_index].split(" ").first.to_i
            prices = file_data[start_index].split(" ").last.to_i

            currency_multipliers = file_data[start_index + 1].split(" ").map {|e| e.to_i}
            row_end_price = 0
            i=0

            (prices).times do 
                row = file_data[start_index + 2 + i].split(" ").map {|e| e.to_i}

                #convert prices 
                row_end_price = row.map.with_index do |currency, index|
                    if index >= currency_multipliers.length
                        currency
                    else
                        currency * currency_multipliers[index..currency_multipliers.length].reduce(:*).to_i
                    end
                end

                @item.prices << row_end_price
                i = i + 1
            end

            # advance start index to next dataset (2 rows of qualifying data followed by rows of prices)
            start_index += 2 + prices
        end
    end
end