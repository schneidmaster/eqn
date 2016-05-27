module Eqn
  module Function
    class If < Treetop::Runtime::SyntaxNode
      def value
        comp_val = elements.shift.value
        ls = elements.shift.value
        rs = elements.shift.value

        comp_val ? ls : rs
      end
    end

    class RoundBase < Treetop::Runtime::SyntaxNode
      def value(fn)
        value = elements.shift.value
        fail ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)
        if elements.empty?
          value.send(fn)
        else
          decimals = elements.shift.value
          (value * 10**decimals).send(fn).to_f / 10**decimals
        end
      end
    end

    class Round < RoundBase
      def value
        super(:round)
      end
    end

    class RoundUp < RoundBase
      def value
        super(:ceil)
      end
    end

    class RoundDown < RoundBase
      def value
        super(:floor)
      end
    end
  end
end
