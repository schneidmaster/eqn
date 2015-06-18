module Eqn
  class Node < Treetop::Runtime::SyntaxNode; end

  class Expression < Node
    def left_associative?
      elements.any? && elements.last.left_associative?
    end

    def term?
      elements.empty?
    end

    # rubocop:disable Metrics/AbcSize
    def value
      if elements.count == 1
        elements.shift.value
      else
        base = elements.shift.value

        # Aggressively consume left associative operators to maintain associativity.
        while left_associative?
          op, num_expr = elements.shift.value
          num_expr_operand = num_expr.elements.shift
          base = base.send(op, num_expr_operand.value)
          elements.push num_expr.elements.shift unless num_expr.term?
        end

        # Apply next right-associative operator (if any) or return.
        if term?
          base
        else
          op, num_expr = elements.shift.value
          base.send(op, num_expr.value)
        end
      end
    end
    # rubocop:enable Metrics/AbcSize

    class ExprGroup < Node
      def left_associative?
        elements.first.left_associative?
      end

      def value
        [elements.shift.value, elements.shift]
      end
    end
  end
end
