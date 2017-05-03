module Eqn
  module Function
    class If < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        comp_val = elements.shift.value(vars)
        ls = elements.shift.value(vars)
        rs = elements.shift.value(vars)

        comp_val ? ls : rs
      end
    end

    class RoundBase < Treetop::Runtime::SyntaxNode
      def value(fn, vars)
        value = elements.shift.value(vars)
        raise ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)
        if elements.empty?
          value.send(fn)
        else
          decimals = elements.shift.value(vars)
          (value * 10**decimals).send(fn).to_f / 10**decimals
        end
      end
    end

    class Round < RoundBase
      def value(vars = {})
        super(:round, vars)
      end
    end

    class RoundUp < RoundBase
      def value(vars = {})
        super(:ceil, vars)
      end
    end

    class RoundDown < RoundBase
      def value(vars = {})
        super(:floor, vars)
      end
    end
  end
end
