if ENV['CIRCLE_ARTIFACTS']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start do
    add_filter '/workers/'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'eqn'
