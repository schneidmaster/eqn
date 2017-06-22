require 'treetop'

# Load the parser from the Treetop grammar.
Treetop.load(File.join(__dir__, 'eqn.treetop'))

# Load custom eqn syntax node.
require File.join(__dir__, 'eqn', 'eqn_node')

# Load other eqn classes.
Dir.glob File.join(__dir__, 'eqn', '**', '*.rb'), &method(:require)
