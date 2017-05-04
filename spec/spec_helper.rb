require 'simplecov'
SimpleCov.start do
  add_filter '/lib/eqn/engine.rb'
  add_filter '/spec'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eqn'
