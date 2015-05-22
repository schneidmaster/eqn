[![Build Status](https://travis-ci.org/schneidmaster/eqn.svg?branch=master)](https://travis-ci.org/schneidmaster/eqn)

# Eqn

Eqn uses the Treetop parser generator to safely evaluate mathematical expressions in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eqn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eqn

## Usage

To evaluate an equation string, run the following:

    $ Eqn::Calculator.calc('1 + 1')
    # => 2

You can also check if an equation is valid:

    $ Eqn::Calculator.valid?('1 + 1')
    # => true
    $ Eqn::Calculator.valid?('1 + / 1')
    # => false

If you want to peek at how Eqn is parsing an equation, run the following to get the syntax tree:

    $ Eqn::Parser.parse('1 + 1')
    # => <syntax tree is printed>

Eqn follows the standard mathematical order of operations: parentheses, exponentiation, multiplication/division, addition/subtraction. It ignores  whitespace, so `1 + 1` === `1+1`. (However, it does not ignore whitespace between two numbers, so `1 1` is invalid.)

### Functions

Eqn presently supports four functions:

**if**

Syntax: `if(comparison, value_if_true, value_if_false)`

For example, `if(5 > 3, 1, 2)` would evaluate to `1`.

**round**

Syntax: `round(number)`

Rounds the number up if the decimal is greater than 0.5 and down otherwise (i.e. "normal" rounding).

**roundup**

Syntax: `roundup(number)`

Rounds the number up to the next whole integer (i.e. ceiling function)

**rounddown**

Syntax: `rounddown(number)`

Rounds the number down to the next whole integer (i.e. floor function)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

The gem uses rspec for testing; run `rspec` from the application root to execute the tests.

## Contributing

1. Fork it ( https://github.com/schneidmaster/eqn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
