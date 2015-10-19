[![Build Status](https://circleci.com/gh/schneidmaster/eqn.svg?style=shield)](https://circleci.com/gh/schneidmaster/eqn) 
[![Test Coverage](https://codeclimate.com/github/schneidmaster/eqn/badges/coverage.svg)](https://codeclimate.com/github/schneidmaster/eqn/coverage)
[![Code Climate](https://codeclimate.com/github/schneidmaster/eqn/badges/gpa.svg)](https://codeclimate.com/github/schneidmaster/eqn)
[![Gem Version](https://badge.fury.io/rb/eqn.svg)](http://badge.fury.io/rb/eqn)
[![security](https://hakiri.io/github/schneidmaster/eqn/master.svg)](https://hakiri.io/github/schneidmaster/eqn/master)

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

### Variables

Eqn supports dynamically inserting values into an equation. Variables are passed to the calculator method via a hash; variable names may contain any lowercase or uppercase letters. Some examples:

    $ Eqn::Calculator.calc('a + 1', a: 1)
    # => 2

    $ Eqn::Calculator.calc('5 * value', value: 2.5)
    # => 12.5

    $ Eqn::Calculator.calc('if(a > 10, b, c)', a: 15, b: 1, c: 0) # see below for function documentation
    # => 1

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

## Authorship

Written by Zach Schneider for [Aha!, the world's #1 product roadmap software](http://www.aha.io/)

## Contributing

1. Fork it ( https://github.com/schneidmaster/eqn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
