module Eqn
  class Node < Treetop::Runtime::SyntaxNode; end

  class Comparation < Node
    def value
      val_one = elements.shift.value
      if elements.empty?
        val_one
      else
        op, val_two = elements.shift.value
        val_one.send(op, val_two)
      end
    end

    class CompGroup < Node
      def value
        [elements.shift.value, elements.shift.value]
      end
    end
  end
end
