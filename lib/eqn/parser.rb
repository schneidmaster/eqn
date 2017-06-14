module Eqn
  class Parser
    class << self
      def parse(data)
        parser = EqnParser.new

        # Pass the data over to the parser instance.
        tree = parser.parse(data)

        # Raise any errors.
        raise ParseError, "Parse error at offset: #{parser.index} -- #{parser.failure_reason}" if tree.nil?

        # Remove extraneous nodes and return tree.
        clean_tree(tree)
      end

      private

      def clean_tree(node)
        # Delete cruft syntax nodes.
        node.elements.delete_if(&method(:syntax_node?))

        # Recurse over any elements with their own children.
        node.elements.reject(&method(:leaf_node?)).each(&method(:clean_tree))

        node
      end

      def syntax_node?(node)
        node.instance_of?(Treetop::Runtime::SyntaxNode)
      end

      def leaf_node?(node)
        node.elements.nil?
      end
    end
  end
end
