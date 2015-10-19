describe Eqn do
  context 'evaluates variables' do
    it 'evaluates variables in arithmetic' do
      expect(Eqn::Calculator.calc('a + 1', a: 1)).to eq(2)
      expect(Eqn::Calculator.calc('-a * 5', a: 2)).to eq(-10)
      expect(Eqn::Calculator.calc('-5 * a', a: 2)).to eq(-10)
      expect(Eqn::Calculator.calc('3 * a', a: 2.5)).to eq(7.5)
    end

    it 'evaluates variables in functions' do
      expect(Eqn::Calculator.calc('if(a > b, c, d)', a: 2, b: 1, c: -5, d: 5)).to eq(-5)
    end

    it 'errors if variable used in wrong context' do
      expect(Eqn::Calculator.valid?('a.1', a: 1)).to eq(false)
      expect { Eqn::Calculator.calc('a.1', a: 1) }.to raise_error(Eqn::ParseError)
    end

    it 'errors if variable value is not numeric' do
      expect(Eqn::Calculator.valid?('a + 1', a: 'string')).to eq(false)
      expect { Eqn::Calculator.calc('a + 1', a: 'string') }.to raise_error(Eqn::NonNumericVariableError)
      expect(Eqn::Calculator.valid?('a + 1', a: {})).to eq(false)
      expect { Eqn::Calculator.calc('a + 1', a: {}) }.to raise_error(Eqn::NonNumericVariableError)
    end

    it 'errors if variable value not given' do
      expect(Eqn::Calculator.valid?('a + 1')).to eq(false)
      expect { Eqn::Calculator.calc('a + 1') }.to raise_error(Eqn::NoVariableValueError)
    end
  end
end
