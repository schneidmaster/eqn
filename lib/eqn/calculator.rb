module Eqn
  class Calculator
    def initialize(eqn, vars = {})
      @eqn = eqn
      @vars = vars
    end

    def set(key_or_hash, value = nil)
      if key_or_hash.is_a?(Hash)
        @vars.merge!(key_or_hash)
      else
        @vars[key_or_hash.intern] = value
      end
    end

    def method_missing(method, *args)
      if %i[calculate calc valid?].include?(method)
        self.class.send(method, @eqn, @vars)
      elsif (match = method.to_s.match(/^[A-Za-z]+=$/))
        @vars[match.to_s.delete('=').intern] = args.first
      elsif (var = method.to_s.match(/^[A-Za-z]+$/).to_s.intern) && @vars.key?(var)
        @vars[var]
      else
        super
      end
    end

    def respond_to_missing?(method)
      %i[calculate calc valid?].include?(method) || method.to_s.match(/^[A-Za-z]+=$/) || (var = method.to_s.match(/^[A-Za-z]+$/).to_s.intern) && @vars.key?(var)
    end

    class << self
      def calculate(data, vars = {})
        result = Parser.parse(data).value(vars)
        raise ZeroDivisionError if result.is_a?(Float) && (result.abs == Float::INFINITY || result.nan?)
        result
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
