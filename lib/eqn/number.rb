module Eqn
  class Node < Treetop::Runtime::SyntaxNode; end

  class Number < Node
    def value
      base = elements.shift.value
      # Apply any exponent.
      base *= elements.shift.value unless elements.empty?
      base
    end

    class SignedNumber < Node
      def value
        # Store sign if any.
        sign_negative = elements.shift.negative? if elements.first.is_a? Terminal::Sign

        # Store base number.
        base = elements.shift.value

        # Handle decimal.
        base += elements.shift.value unless elements.empty?

        # Apply sign if any.
        if sign_negative
          -base
        else
          base
        end
      end
    end

    class Decimal < Node
      def value
        elements.shift.dec_value
      end
    end

    class Exponent < Node
      def value
        10**elements.shift.value
      end
    end
  end
end
