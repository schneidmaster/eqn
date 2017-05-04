require 'simplecov'
SimpleCov.start do
  add_filter 'lib/eqn/engine.rb'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eqn'
