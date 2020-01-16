# BuyLowSellHigh

Provided input, this application converts currency to a base denomination and outputs the difference between the highest and lowest priced values
in a given dataset.

This technical prompt really challenged me. Initially, I was completely unfamiliar with any type of coding problem like this and it took me a while
to even understand how the inputs were to be interpreted, let alone be calculated to the final output. However, after much deliberation and
persistance--and after a few failed experiments solving the problem by hand--I finally managed to grasp what was needed.

The controller file 'buy_low_sell_high.rb' can be found in './bin', and accompanying class files are located in './lib'.

Test files are found in './spec'. In addition to the input file supplied, I developed my own with an additional dataset, and one additional
denomination count. 

Tests are as follows:

    01_dataset_generator_spec - 
        - tests the generation of new Dataset classes
        - test the correct number of datasets generated

    02_dataset_spec -
        - checks the appropriate number of prices per dataset
        - correctly caclulates prices in base terms
        - calculates the max sale correctly
        - output is displayed in correct format

## Usage

Edit file_path in './bin/buy_low_sell_high.rb' with the correct path to the input file, run, and see the results of my magic.

- Run `bundle install` in the terminal to install dependencies
- Run using `ruby ./bin/buy_low_sell_high.rb` in the terminal
- Run tests with `rspec ./spec/01_data_set_generator_spec.rb` and
                 `rspec ./spec/02_dataset_spec.rb`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blainelawson/buy_low_sell_high.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
