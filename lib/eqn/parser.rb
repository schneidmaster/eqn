require 'eqn/function'
require 'eqn/comparation'
require 'eqn/expression'
require 'eqn/number'
require 'eqn/terminal'

module Eqn
  class Parser
    # Load the Treetop grammar from the grammar.
    Treetop.load(File.join(File.dirname(__dir__), 'eqn.treetop'))
    @@parser = EqnParser.new

    def self.parse(data)
      # Remove any whitespace and pass the data over to the parser instance
      tree = @@parser.parse(data.downcase.delete(' '))

      # Raise any errors.
      if tree.nil?
        fail Exception, "Parse error at offset: #{@@parser.index}" + @@parser.failure_reason
      end

      # Remove extraneous nodes and return the tree.
      clean_tree(tree)
    end

    def self.clean_tree(root_node)
      return if root_node.elements.nil?
      root_node.elements.delete_if { |node| node.class.name == 'Treetop::Runtime::SyntaxNode' }
      root_node.elements.each { |node| clean_tree(node) }
      root_node
    end
    private_class_method :clean_tree
  end
end
