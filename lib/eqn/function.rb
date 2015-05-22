module Eqn
  class Node < Treetop::Runtime::SyntaxNode; end

  module Function
    class If < Node
      def value
        comp_val = elements.shift.value
        ls = elements.shift.value
        rs = elements.shift.value

        if comp_val
          ls
        else
          rs
        end
      end
    end

    class Round < Node
      def value
        elements.shift.value.round
      end
    end

    class RoundUp < Node
      def value
        elements.shift.value.ceil
      end
    end

    class RoundDown < Node
      def value
        elements.shift.value.floor
      end
    end
  end
end
