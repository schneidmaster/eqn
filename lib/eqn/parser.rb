module Eqn
  # Primary parser class to convert a string equation to a tree of nodes.
  class Parser
    class << self
      def parse(equation)
        parser = EqnParser.new

        # Pass the equation over to the parser instance.
        root_node = parser.parse(equation)

        # Raise any errors.
        raise ParseError, "Parse error at offset: #{parser.index} -- #{parser.failure_reason}" if root_node.nil?

        # Remove extraneous nodes and return tree.
        root_node.clean_tree!

        root_node
      end
    end
  end
end
