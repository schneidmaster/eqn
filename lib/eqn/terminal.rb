module Eqn
  module Terminal
    class Node < Treetop::Runtime::SyntaxNode; end

    class Digits < Node
      def dec_value
        ".#{text_value}".to_f
      end

      def value
        text_value.to_f
      end
    end

    class Exp < Node; end

    class Sign < Node
      def negative?
        text_value == '-'
      end
    end

    class Op < Node
      class Add < Node
        def value
          '+'
        end
      end

      class Sub < Node
        def value
          '-'
        end
      end

      class Mul < Node
        def value
          '*'
        end
      end

      class Div < Node
        def value
          '/'
        end
      end

      class Pow < Node
        def value
          '**'
        end
      end
    end

    class CompOp < Node
      class Lt < Node
        def value
          '<'
        end
      end

      class Gt < Node
        def value
          '>'
        end
      end

      class Lte < Node
        def value
          '<='
        end
      end

      class Gte < Node
        def value
          '>='
        end
      end

      class Eq < Node
        def value
          '=='
        end
      end

      class Neq < Node
        def value
          '!='
        end
      end
    end
  end
end
