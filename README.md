# TransparenciaAlagoas

This gem aims to facilitating access to the "Portal da Transparência (http://transparencia.al.gov.br)" of the state of Alagoas. It abstracts the access to this portal data that is provided through a REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'transparencia_alagoas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transparencia_alagoas

## Usage

This Gem are not covering the whole API yet. For while we provide the resources of servants, biddings and patrimony. There a class responsible for each one of this resources.

Take a look at some examples:

```ruby
# encoding: utf-8

require 'transparencia_alagoas'

# Get active servant that received some money on month 8 of year 2016
# If month and/or year are not provided we'll use the current month and/or year
active_servants = TransparenciaAlagoas::Servant.active_servants(month:8, year:2016)
```

To have details about Portal da Transparência API please take a look on this [documentation](http://transparencia.al.gov.br/portal/api).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/transparencia_alagoas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

