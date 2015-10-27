module Eqn
  module Terminal
    class Node < Treetop::Runtime::SyntaxNode; end

    class Variable < Node
      def value
        val = Eqn::Calculator.class_variable_get(:@@vars)[text_value.intern]
        fail NoVariableValueError, "No value given for: #{text_value}" unless val
        fail NonNumericVariableError, "Variable #{text_value} value is nonnumeric: #{val}" unless val.is_a? Numeric
        val
      end
    end

    class Digits < Node
      def dec_value
        ".#{text_value}".to_f
      end

      def value
        text_value.to_f
      end
    end

    class Sign < Node
      def negative?
        text_value == '-'
      end
    end

    class Op < Node
      def left_associative?
        is_a? LeftAssociativeOp
      end

      class LeftAssociativeOp < Op; end
      class RightAssociativeOp < Op; end

      class Add < RightAssociativeOp
        def value
          :+
        end
      end

      class Sub < LeftAssociativeOp
        def value
          :-
        end
      end

      class Mul < RightAssociativeOp
        def value
          :*
        end
      end

      class Div < LeftAssociativeOp
        def value
          :/
        end
      end

      class Pow < RightAssociativeOp
        def value
          :**
        end
      end
    end

    class CompOp < Node
      class Lt < Node
        def value
          :<
        end
      end

      class Gt < Node
        def value
          :>
        end
      end

      class Lte < Node
        def value
          :<=
        end
      end

      class Gte < Node
        def value
          :>=
        end
      end

      class Eq < Node
        def value
          :==
        end
      end

      class Neq < Node
        def value
          :!=
        end
      end
    end
  end
end
