module Eqn
  class Parser
    # Load the Treetop grammar from the grammar.
    Treetop.load(File.join(File.dirname(__dir__), 'eqn.treetop'))
    @@parser = EqnParser.new

    class << self
      def parse(data)
        # Pass the data over to the parser instance.
        tree = @@parser.parse(data.downcase)

        # Raise any errors.
        raise ParseError, "Parse error at offset: #{@@parser.index}" + @@parser.failure_reason if tree.nil?

        # Remove extraneous nodes and return tree.
        clean_tree(tree)
      end

      private

      def clean_tree(root_node)
        return if root_node.elements.nil?
        root_node.elements.delete_if { |node| node.class == Treetop::Runtime::SyntaxNode }
        root_node.elements.each { |node| clean_tree(node) }
        root_node
      end
    end
  end
end
