module Eqn
  # Node class for a comparison between expressions.
  class Comparation < EqnNode
    def value(vars = {})
      val_one = elements.shift.value(vars)
      if term?
        val_one
      else
        val_one.send(*elements.shift.value(vars))
      end
    end

    # Node class for the operator and expression being compared.
    class CompGroup < EqnNode
      def value(vars = {})
        [elements.shift.value(vars), elements.shift.value(vars)]
      end
    end
  end
end
