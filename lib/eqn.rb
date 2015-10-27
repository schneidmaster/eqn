require 'treetop'
Dir.glob File.join(__dir__, 'eqn', '**', '*.rb'), &method(:require)
