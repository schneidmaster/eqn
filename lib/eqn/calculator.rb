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
      if %i(calculate calc valid?).include?(method)
        self.class.send(method, @eqn, @vars)
      elsif (match = method.to_s.match(/^[A-Za-z]+=$/))
        @vars[match.to_s.delete('=').intern] = args.first
      elsif (var = method.to_s.match(/^[A-Za-z]+$/).to_s.intern) && @vars.key?(var)
        @vars[var]
      else
        super
      end
    end

    class << self
      def calculate(data, vars = {})
        @@vars = vars
        begin
          result = Parser.parse(data).value
          raise ZeroDivisionError if result.is_a?(Float) && (result.abs == Float::INFINITY || result.nan?)
          result
        ensure
          @@vars = nil
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
