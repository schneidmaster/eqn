# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eqn/version'

config_files = %w(.rspec .rubocop.yml .ruby-version Appraisals circle.yml)

Gem::Specification.new do |spec|
  spec.name          = 'eqn'
  spec.version       = Eqn::VERSION
  spec.authors       = ['Zach Schneider']
  spec.email         = ['zach@aha.io']

  spec.summary       = 'A gem to evaluate numerical equations.'
  spec.description   = 'A gem to evaluate numerical equations. Includes support for variables and functions.'
  spec.homepage      = 'https://github.com/schneidmaster/eqn'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| config_files.include?(f) || f.match(%r{^(spec|gemfiles)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'treetop', '>= 1.2.0'

  spec.add_development_dependency 'appraisal', '~> 2.1.0'
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.42'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
end
