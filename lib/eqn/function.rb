module Eqn
  module Function
    # Node class for the if function.
    class If < EqnNode
      def value(vars = {})
        comp_val = elements.shift.value(vars)
        ls = elements.shift.value(vars)
        rs = elements.shift.value(vars)

        comp_val ? ls : rs
      end
    end

    # Base node class for round functions.
    class RoundBase < EqnNode
      def value(vars)
        value = elements.shift.value(vars)
        raise ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)

        if term?
          value.send(self.class::ROUND_METHOD)
        else
          round_to_precision(vars, value)
        end
      end

      private

      def round_to_precision(vars, value)
        decimals = elements.shift.value(vars)
        (value * 10**decimals).send(self.class::ROUND_METHOD).to_f / 10**decimals
      end
    end

    # Node class for the round function.
    class Round < RoundBase
      ROUND_METHOD = :round
    end

    # Node class for the roundup function.
    class RoundUp < RoundBase
      ROUND_METHOD = :ceil
    end

    # Node class for the rounddown function.
    class RoundDown < RoundBase
      ROUND_METHOD = :floor
    end
  end
end
