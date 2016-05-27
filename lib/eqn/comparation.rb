module Eqn
  class Comparation < Treetop::Runtime::SyntaxNode
    def value
      val_one = elements.shift.value
      if elements.empty?
        val_one
      else
        val_one.send(*elements.shift.value)
      end
    end

    class CompGroup < Treetop::Runtime::SyntaxNode
      def value
        [elements.shift.value, elements.shift.value]
      end
    end
  end
end
