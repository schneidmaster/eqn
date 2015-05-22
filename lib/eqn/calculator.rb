module Eqn
  class Calculator
    class << self
      def calc(data)
        Parser.parse(data).value
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
