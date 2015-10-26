module Eqn
  class Node < Treetop::Runtime::SyntaxNode; end

  module Function
    class If < Node
      def value
        comp_val = elements.shift.value
        ls = elements.shift.value
        rs = elements.shift.value

        comp_val ? ls : rs
      end
    end

    class Round < Node
      def value
        value = elements.shift.value
        fail ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)
        if elements.empty?
          value.round
        else
          value.round(elements.shift.value)
        end
      end
    end

    class RoundUp < Node
      def value
        value = elements.shift.value
        fail ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)
        if elements.empty?
          value.ceil
        else
          decimals = elements.shift.value
          (value * 10**decimals).ceil.to_f / 10**decimals
        end
      end
    end

    class RoundDown < Node
      def value
        value = elements.shift.value
        fail ZeroDivisionError if value.is_a?(Float) && (value.abs == Float::INFINITY || value.nan?)
        if elements.empty?
          value.floor
        else
          decimals = elements.shift.value
          (value * 10**decimals).floor.to_f / 10**decimals
        end
      end
    end
  end
end
