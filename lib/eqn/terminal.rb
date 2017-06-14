module Eqn
  module Terminal
    class Variable < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        val = vars[text_value.to_sym]
        raise NoVariableValueError, "No value given for: #{text_value}" unless val
        raise NonNumericVariableError, "Variable #{text_value} value is nonnumeric: #{val}" unless val.is_a? Numeric
        val
      end
    end

    class Digits < Treetop::Runtime::SyntaxNode
      def dec_value
        ".#{text_value}".to_f
      end

      def value(_vars = {})
        text_value.to_f
      end
    end

    class Sign < Treetop::Runtime::SyntaxNode
      def negative?
        text_value == '-'
      end
    end

    class Op < Treetop::Runtime::SyntaxNode
      def left_associative?
        is_a? LeftAssociativeOp
      end

      def value(_vars = {})
        text_value == '^' ? :** : text_value.to_sym
      end

      class LeftAssociativeOp < Op; end
      class RightAssociativeOp < Op; end
    end

    class CompOp < Treetop::Runtime::SyntaxNode
      def value(_vars = {})
        text_value == '=' ? :== : text_value.to_sym
      end
    end
  end
end
