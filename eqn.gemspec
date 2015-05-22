# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eqn/version'

Gem::Specification.new do |spec|
  spec.name          = 'eqn'
  spec.version       = Eqn::VERSION
  spec.authors       = ['Zach Schneider']
  spec.email         = ['zach@aha.io']

  spec.summary       = 'A gem to evaluate numerical equations.'
  spec.description   = 'A gem to evaluate numerical equations. Includes support for functions.'
  spec.homepage      = 'https://github.com/schneidmaster/eqn'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'treetop', '~> 1.4.14'

  spec.add_development_dependency 'bundler', '~> 1.7.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.31'
end
