module Eqn
  class Expression < Treetop::Runtime::SyntaxNode
    def left_associative?
      elements.any? && elements.last.left_associative?
    end

    def term?
      elements.empty?
    end

    def value(vars = {})
      if elements.count == 1
        elements.shift.value(vars)
      else
        base = elements.shift.value(vars)

        # Aggressively consume left associative operators to maintain associativity.
        base = consume_while_left_associative(base, vars)

        # Apply next right-associative operator (if any) or return.
        if term?
          base
        else
          op, num_expr = elements.shift.value(vars)
          base.send(op, num_expr.value(vars))
        end
      end
    end

    private

    def consume_while_left_associative(base, vars)
      return base unless left_associative?
      op, num_expr = elements.shift.value(vars)
      num_expr_operand = num_expr.elements.shift
      base = base.send(op, num_expr_operand.value(vars))
      elements.push num_expr.elements.shift unless num_expr.term?
      consume_while_left_associative(base, vars)
    end

    class ExprGroup < Treetop::Runtime::SyntaxNode
      def left_associative?
        elements.first.left_associative?
      end

      def value(vars = {})
        [elements.shift.value(vars), elements.shift]
      end
    end
  end
end
