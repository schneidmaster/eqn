module Eqn
  module Terminal
    # Node class for a variable.
    class Variable < EqnNode
      def value(vars = {})
        val = vars[text_value.to_sym]
        raise NoVariableValueError, "No value given for: #{text_value}" unless val
        raise NonNumericVariableError, "Variable #{text_value} value is nonnumeric: #{val}" unless val.is_a?(Numeric)

        val
      end
    end

    # Node class for a group of numbers.
    class Digits < EqnNode
      def dec_value
        ".#{text_value}".to_f
      end

      def value(_vars = {})
        text_value.to_f
      end
    end

    # Node class for a unary minus.
    class UnaryMinus < EqnNode; end

    # Node class for an operator.
    class Op < EqnNode
      def left_associative?
        is_a?(LeftAssociativeOp)
      end

      def value(_vars = {})
        text_value == '^' ? :** : text_value.to_sym
      end

      class LeftAssociativeOp < Op; end
      class RightAssociativeOp < Op; end
    end

    # Node class for a comparation operator.
    class CompOp < EqnNode
      def value(_vars = {})
        text_value == '=' ? :== : text_value.to_sym
      end
    end
  end
end
