module Eqn
  class Calculator
    class << self
      def calc(data)
        result = Parser.parse(data).value
        fail ZeroDivisionError if result == Float::INFINITY
        result
      end

      def valid?(data)
        calc(data)
        true
      rescue Exception
        false
      end
    end
  end
end
