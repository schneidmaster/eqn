module Eqn
  class Calculator
    class << self
      def calc(data)
        Parser.parse(data).value
      end
    end
  end
end
