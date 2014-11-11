# RailsCurrency

A Ruby gem to real time convert among different currencies with services from xe.com and google.com
This gem is upgraded version of http://rubygems.org/gems/rails_currency/versions/1.2 and https://github.com/helloween/rails_currency

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_currency'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_currency

## Usage

To get supported currencies
```ruby
# For google supported currencies
RailsCurrency::Convertor::Google::CURRENCIES
# For xe supported currencies
RailsCurrency::Convertor::Xe::CURRENCIES
```
To get rate
```ruby
# By default it will use service from google
RailsCurrency::Convertor.get_rate('CNY', 'USD')
# To convert amount with google.com
RailsCurrency::Convertor.get_rate('CNY', 'USD', 'google')
RailsCurrency::Convertor::Google.get_rate('CNY', 'USD')
# To convert amount with xe.com
RailsCurrency::Convertor.get_rate('CNY', 'USD', 'xe')
RailsCurrency::Convertor::Xe.get_rate('CNY', 'USD')
```
To convert an amount
```ruby
# By default it will use service from google
RailsCurrency::Convertor.convert(100, 'CNY', 'USD')
# To convert amount with google.com
RailsCurrency::Convertor.convert(100, 'CNY', 'USD', 'google')
RailsCurrency::Convertor::Google.convert(100, 'CNY', 'USD')
# To convert amount with xe.com
RailsCurrency::Convertor.convert(100, 'CNY', 'USD', 'xe')
RailsCurrency::Convertor::Xe.convert(100, 'CNY', 'USD')
```

## Contributing

1. Fork it ( https://github.com/allerin/rails_currency/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
