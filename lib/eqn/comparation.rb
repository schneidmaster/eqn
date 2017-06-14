module Eqn
  # Node class for a comparison between expressions.
  class Comparation < Treetop::Runtime::SyntaxNode
    def value(vars = {})
      val_one = elements.shift.value(vars)
      if elements.empty?
        val_one
      else
        val_one.send(*elements.shift.value(vars))
      end
    end

    # Node class for the operator and expression being compared.
    class CompGroup < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        [elements.shift.value(vars), elements.shift.value(vars)]
      end
    end
  end
end
