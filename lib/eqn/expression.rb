module Eqn
  class Node < Treetop::Runtime::SyntaxNode; end

  class Expression < Node
    def value
      if elements.count == 1
        elements.shift.value
      else
        base = elements.shift.value
        op, num = elements.shift.value
        base.send(op, num)
      end
    end

    class ExprGroup < Node
      def value
        [elements.shift.value, elements.shift.value]
      end
    end
  end
end
