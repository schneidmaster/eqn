module Eqn
  class EqnError < StandardError; end
  class NonNumericVariableError < EqnError; end
  class NoVariableValueError < EqnError; end
  class ParseError < EqnError; end
  class ZeroDivisionError < EqnError; end
end
