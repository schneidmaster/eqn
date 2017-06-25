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

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install eqn
```

## Usage

To evaluate an equation string, run the following:

```ruby
Eqn::Calculator.calc('1 + 1')
# => 2
```

You can also check if an equation is valid:

```ruby
Eqn::Calculator.valid?('1 + 1')
# => true
Eqn::Calculator.valid?('1 + / 1')
# => false
```

If you want to peek at how Eqn is parsing an equation, run the following to get the syntax tree:

```ruby
Eqn::Parser.parse('1 + 1')
# => <syntax tree is printed>
```

Eqn follows the standard mathematical order of operations: parentheses, exponentiation, multiplication/division, addition/subtraction. It ignores  whitespace, so `1 + 1` === `1+1`. (However, it does not ignore whitespace between two numbers, so `1 1` is invalid.)

### Variables

Eqn supports dynamically inserting values into an equation. Variables are passed to the calculator method via a hash; variable names may contain any lowercase or uppercase letters. Some examples:

```ruby
Eqn::Calculator.calc('a + 1', a: 1)
# => 2

Eqn::Calculator.calc('5 * value', value: 2.5)
# => 12.5

Eqn::Calculator.calc('if(a > 10, b, c)', a: 15, b: 1, c: 0) # see below for function documentation
# => 1
```

If you need distinct equations with variable sets, you can instantiate separate instances:

```ruby
calc = Eqn::Calculator.new('1 + abc', abc: 2.0)
calc.calc
# => 3.0
calc_two = Eqn::Calculator.new('1 + abc', abc: 5.0)
calc_two.calc
# => 6.0
```

On calculator instances, variables can be set via key-value syntax, hash syntax, or as a method:

```ruby
calc = Eqn::Calculator.new('1 + abc')
calc.set(:abc, 3.0)
calc.abc
# => 3.0
calc.set(abc: 4.0)
calc.abc
# => 4.0
calc.abc = 5.0
calc.abc
# => 5.0
```

### Functions

Eqn presently supports four functions:

**if**

Syntax: `if(comparison, value_if_true, value_if_false)`

For example, `if(5 > 3, 1, 2)` would evaluate to `1`.

**round**

Syntax: `round(number, [decimals])`

Rounds the number up if the decimal is greater than 0.5 and down otherwise (i.e. "normal" rounding). Optionally, pass a number of decimal places to round to as a second parameter (the default is 0).

**roundup**

Syntax: `roundup(number, [decimals])`

Rounds the number up (i.e. ceiling function). Optionally, pass a number of decimal places to round to as a second parameter (the default is 0).

**rounddown**

Syntax: `rounddown(number, [decimals])`

Rounds the number down (i.e. floor function). Optionally, pass a number of decimal places to round to as a second parameter (the default is 0).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

The gem uses rspec for testing and appraisal to test against multiple versions of treetop (the only runtime dependency). From the command line, run `bundle exec appraisal install` to install gems and `bundle exec appraisal rspec` to run the complete test suite. (You can still run `bundle exec rspec` to only test against the latest version of treetop while developing.)

## Release

Before publishing, run `bin/compile` to precompile ruby source code for the parser. This will automatically be used by the gem if present, and provides a small performance increase over generating the source code at runtime.

## Authorship

Written by Zach Schneider for [Aha!, the world's #1 product roadmap software](http://www.aha.io/)

## Contributing

1. Fork it ([https://github.com/schneidmaster/eqn/fork](https://github.com/schneidmaster/eqn/fork))
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
