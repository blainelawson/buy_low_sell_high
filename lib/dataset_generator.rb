require 'pry'
class DatasetGenerator
    def self.generate(file_data)
        datasets_amt = file_data[0].to_i # Indicates number of sets (useable for tests)

        # Initialize dataset start point
        start_index = 1

        # Find first dataset's denoms and prices--this is repeatable and also lets me know how many 
        # rows of data are in each set--what index to start the process on again.
        datasets_amt.times do
            @dataset = Dataset.new
    
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

                @dataset.prices << row_end_price
                i = i + 1
            end

            start_index += 2 + prices
        end
    end
end
