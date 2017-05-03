module Eqn
  class Comparation < Treetop::Runtime::SyntaxNode
    def value(vars = {})
      val_one = elements.shift.value(vars)
      if elements.empty?
        val_one
      else
        val_one.send(*elements.shift.value(vars))
      end
    end

    class CompGroup < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        [elements.shift.value(vars), elements.shift.value(vars)]
      end
    end
  end
end
