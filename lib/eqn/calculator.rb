module Eqn
  class Calculator
    def initialize(eqn, vars = {})
      @eqn = eqn
      @vars = vars
    end

    def set(key, value)
      @vars[key.intern] = value
    end

    def method_missing(method)
      super unless %i(calculate calc valid?).include?(method)
      self.class.send(method, @eqn, @vars)
    end

    class << self
      def calculate(data, vars = {})
        @@cache_vars = @@vars if defined?(@@vars)
        @@vars = vars
        begin
          result = Parser.parse(data).value
          raise ZeroDivisionError if result.is_a?(Float) && (result.abs == Float::INFINITY || result.nan?)
          result
        ensure
          @@vars = defined?(@@cache_vars) ? @@cache_vars : nil
        end
      end
      alias calc calculate

      def valid?(data, vars = {})
        calc(data, vars)
        true
      rescue EqnError
        false
      end
    end
  end
end
