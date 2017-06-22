module Eqn
  # Node class for a simple number.
  class Number < EqnNode
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

    # Node class for a signed number.
    class SignedNumber < EqnNode
      def value(vars = {})
        # Store sign if any.
        sign_negative = elements.shift.negative? if elements.first.is_a? Terminal::Sign

        # Evaluate float.
        value = elements.shift.value(vars)

        # Apply sign if any.
        sign_negative ? -value : value
      end
    end

    # Node class for the decimal part of a non-integer.
    class Decimal < EqnNode
      def value(_vars = {})
        elements.shift.dec_value
      end
    end

    # Node class for the exponent part of a number.
    class Exponent < EqnNode
      def value(vars = {})
        10**elements.shift.value(vars)
      end
    end
  end
end
