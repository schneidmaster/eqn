module Eqn
  class Number < Treetop::Runtime::SyntaxNode
    def value
      base = elements.shift.value
      # Apply any exponent.
      base *= elements.shift.value unless elements.empty?
      base
    end

    class SignedNumber < Treetop::Runtime::SyntaxNode
      def value
        # Store sign if any.
        sign_negative = elements.shift.negative? if elements.first.is_a? Terminal::Sign

        # Evaluate float.
        value = elements.shift.value

        # Apply sign if any.
        sign_negative ? -value : value
      end
    end

    class Float < Treetop::Runtime::SyntaxNode
      def value
        base = elements.shift.value

        # Add any decimal.
        base += elements.shift.value unless elements.empty?

        base
      end
    end

    class Decimal < Treetop::Runtime::SyntaxNode
      def value
        elements.shift.dec_value
      end
    end

    class Exponent < Treetop::Runtime::SyntaxNode
      def value
        10**elements.shift.value
      end
    end
  end
end
