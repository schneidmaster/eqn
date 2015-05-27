module Eqn
  class Calculator
    class << self
      def calc(data)
        result = Parser.parse(data).value
        fail ZeroDivisionError if result.is_a?(Float) && result.abs == Float::INFINITY
        result
      end

      def valid?(data)
        calc(data)
        true
      rescue ParseError, ZeroDivisionError
        false
      end
    end
  end
end
