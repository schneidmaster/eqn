module Eqn
  module Function
    # Node class for the if function.
    class If < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        comp_val = elements.shift.value(vars)
        ls = elements.shift.value(vars)
        rs = elements.shift.value(vars)

        comp_val ? ls : rs
      end
    end

    # Base node class for round functions.
    class RoundBase < Treetop::Runtime::SyntaxNode
      def value(fn, vars)
        value = elements.shift.value(vars)
        raise ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)
        if elements.empty?
          value.send(fn)
        else
          round_to_precision(fn, vars, value)
        end
      end

      private

      def round_to_precision(fn, vars, value)
        decimals = elements.shift.value(vars)
        (value * 10**decimals).send(fn).to_f / 10**decimals
      end
    end

    # Node class for the round function.
    class Round < RoundBase
      def value(vars = {})
        super(:round, vars)
      end
    end

    # Node class for the roundup function.
    class RoundUp < RoundBase
      def value(vars = {})
        super(:ceil, vars)
      end
    end

    # Node class for the rounddown function.
    class RoundDown < RoundBase
      def value(vars = {})
        super(:floor, vars)
      end
    end
  end
end
