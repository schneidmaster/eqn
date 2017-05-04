require 'treetop'

# Load the parser from the Treetop grammar.
Treetop.load(File.join(__dir__, 'eqn.treetop'))

# Load eqn classes.
Dir.glob File.join(__dir__, 'eqn', '**', '*.rb'), &method(:require)
