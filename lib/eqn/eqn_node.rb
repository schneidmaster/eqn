module Eqn
  # Eqn parser node with helper methods for cleaning.
  class EqnNode < Treetop::Runtime::SyntaxNode
    def term?
      elements.nil? || elements.empty?
    end

    def clean_tree!
      # Return if node is a terminal.
      return if term?

      # Delete any cruft syntax nodes.
      elements.delete_if { |node| !node.is_a?(EqnNode) }

      # Recurse over any elements with their own children.
      elements.each(&:clean_tree!)
    end
  end
end
