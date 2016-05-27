module Eqn
  class Calculator
    class << self
      def calculate(data, vars = {})
        @@vars = vars
        begin
          result = Parser.parse(data).value
          fail ZeroDivisionError if result.is_a?(Float) && (result.abs == Float::INFINITY || result.nan?)
          result
        ensure
          @@vars = nil
        end
      end
      alias_method :calc, :calculate

      def valid?(data, vars = {})
        calc(data, vars)
        true
      rescue EqnError
        false
      end
    end
  end
end
