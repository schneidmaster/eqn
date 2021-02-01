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

    def method_missing(method, *args)
      if delegated_method?(method)
        self.class.send(method, @eqn, @vars)
      elsif match_setter?(method)
        @vars[setter_key(method)] = args.first
      elsif match_getter?(method)
        @vars[getter_key(method)]
      else
        super
      end
    end

    def respond_to_missing?(method, _include_private = false)
      delegated_method?(method) || match_setter?(method) || match_getter?(method) || super
    end

    private

    def delegated_method?(method)
      %i(calculate calc valid?).include?(method.to_sym)
    end

    def setter_key(method)
      match = method.to_s.match(/^[A-Za-z]+=$/)
      return unless match

      match.to_s.delete('=').to_sym
    end

    def match_setter?(method)
      !setter_key(method).nil?
    end

    def getter_key(method)
      match = method.to_s.match(/^[A-Za-z]+$/)
      return if match.nil?

      key = match.to_s.to_sym
      return unless @vars.key?(key)

      key
    end

    def match_getter?(method)
      !getter_key(method).nil?
    end

    class << self
      def calculate(equation, vars = {})
        result = Parser.parse(equation).value(vars)
        raise ZeroDivisionError if result.is_a?(Float) && (result.abs == Float::INFINITY || result.nan?)

        result
      end
      alias calc calculate

      def valid?(equation, vars = {})
        calculate(equation, vars)
        true
      rescue EqnError
        false
      end
    end
  end
end
