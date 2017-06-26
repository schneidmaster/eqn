require 'treetop'
require 'treetop/version'

# Load the parser from the Treetop grammar.
# Use precompiled version if present, or fallback to loading grammar.
# Also load grammar if before treetop 1.5, to avoid a bug in the generated code.
precompiled_path = File.join(__dir__, 'grammar', 'eqn.rb')
grammar_path = File.join(__dir__, 'grammar', 'eqn.treetop')
recent_treetop = (Treetop::VERSION::MINOR >= 5 || Treetop::VERSION::MAJOR > 1)
File.exist?(precompiled_path) && recent_treetop ? require(precompiled_path) : Treetop.load(grammar_path)

# Load custom eqn syntax node.
require File.join(__dir__, 'eqn', 'eqn_node')

# Load other eqn classes.
Dir.glob File.join(__dir__, 'eqn', '**', '*.rb'), &method(:require)
