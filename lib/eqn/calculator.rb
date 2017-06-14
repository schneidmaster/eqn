module Eqn
  # Primary calculator class used for performing calculations or creating eqn instances.
  class Calculator
    def initialize(eqn, vars = {})
      @eqn = eqn
      @vars = vars
    end

    def set(key_or_hash, value = nil)
      if key_or_hash.is_a?(Hash)
        @vars.merge!(key_or_hash)
      else
        @vars[key_or_hash.to_sym] = value
      end
    end

    def method_missing(method, *args) # rubocop:disable AbcSize
      if %i(calculate calc valid?).include?(method)
        self.class.send(method, @eqn, @vars)
      elsif (match = method.to_s.match(/^[A-Za-z]+=$/))
        @vars[match.to_s.delete('=').to_sym] = args.first
      elsif (var = method.to_s.match(/^[A-Za-z]+$/).to_s.to_sym) && @vars.key?(var)
        @vars[var]
      else
        super
      end
    end

    def respond_to_missing?(method, _p2 = false)
      %i(calculate calc valid?).include?(method) ||
        method.to_s.match(/^[A-Za-z]+=$/) ||
        (var = method.to_s.match(/^[A-Za-z]+$/).to_s.to_sym) && @vars.key?(var)
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
