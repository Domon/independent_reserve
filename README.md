# Independent Reserve

Unofficial Independent Reserve API client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'independent_reserve'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install independent_reserve

## Usage

```ruby
require 'independent_reserve'

IndependentReserve.market_summary
# => {
#      day_highest_price:                     '9545.00'.to_d,
#      day_lowest_price:                      '8750.00'.to_d,
#      day_avg_price:                         '9215.18'.to_d,
#      day_volume_xbt:                        '481.67961367'.to_d,
#      day_volume_xbt_in_secondary_currrency: '476.32153486'.to_d,
#      current_lowest_offer_price:            '9409.94'.to_d,
#      current_highest_bid_price:             '9350.00'.to_d,
#      last_price:                            '9449.19'.to_d,
#      primary_currency_code:                 'Xbt',
#      secondary_currency_code:               'Aud',
#      created_timestamp_utc:                 '2017-11-02T13:29:59.8126139Z',
#    }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Domon/independent_reserve. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

## Code of Conduct

Everyone interacting in the IndependentReserve project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/independent_reserve/blob/master/CODE_OF_CONDUCT.md).
