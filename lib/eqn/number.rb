module Eqn
  class Number < Treetop::Runtime::SyntaxNode
    def value(vars = {})
      base = elements.shift.value(vars)

      return base if elements.empty?

      if instance_of?(Float)
        # Apply any decimal if a float.
        base + elements.shift.value(vars)
      else
        # Apply any exponent if a simple number.
        base * elements.shift.value(vars)
      end
    end

    class Float < Number; end

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
