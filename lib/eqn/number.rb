module Eqn
  class Number < Treetop::Runtime::SyntaxNode
    def value(vars = {})
      base = elements.shift.value(vars)
      # Apply any exponent.
      base *= elements.shift.value(vars) unless elements.empty?
      base
    end

    class SignedNumber < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        # Store sign if any.
        sign_negative = elements.shift.negative? if elements.first.is_a? Terminal::Sign

        # Evaluate float.
        value = elements.shift.value(vars)

        # Apply sign if any.
        sign_negative ? -value : value
      end
    end

    class Float < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        base = elements.shift.value(vars)

        # Add any decimal.
        base += elements.shift.value(vars) unless elements.empty?

        base
      end
    end

    class Decimal < Treetop::Runtime::SyntaxNode
      def value(_vars = {})
        elements.shift.dec_value
      end
    end

    class Exponent < Treetop::Runtime::SyntaxNode
      def value(vars = {})
        10**elements.shift.value(vars)
      end
    end
  end
end
