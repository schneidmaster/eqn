module Eqn
  # Node class for an expression.
  class Expression < Treetop::Runtime::SyntaxNode
    def left_associative?
      elements.any? && elements.last.left_associative?
    end

    def term?
      elements.empty?
    end

    def value(vars = {})
      base = elements.shift.value(vars)

      # Aggressively consume left associative operators to maintain associativity.
      base = consume_while_left_associative(base, vars)

      # Apply next right-associative operator (if any) or return.
      apply_next_operator(base, vars)
    end

    private

    def consume_while_left_associative(base, vars)
      return base unless left_associative?
      base = apply_next_operator(base, vars)
      consume_while_left_associative(base, vars)
    end

    def apply_next_operator(base, vars)
      return base if term?
      left_associative = elements.last.left_associative?
      op, num_expr = elements.shift.value(vars)
      if left_associative
        apply_left_associative(base, vars, op, num_expr)
      else
        base.send(op, num_expr.value(vars))
      end
    end

    def apply_left_associative(base, vars, op, num_expr)
      num_expr_operand = num_expr.elements.shift
      elements.push(num_expr.elements.shift) unless num_expr.term?
      base.send(op, num_expr_operand.value(vars))
    end

    # Node class for the operator and latter component of an expression.
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
