describe Eqn do
  context 'compares expressions' do
    it 'compares two numbers with >' do
      expect(Eqn::Calculator.calc('2 > 1')).to eq(true)
      expect(Eqn::Calculator.calc('1 > 2')).to eq(false)
    end

    it 'compares two numbers with <' do
      expect(Eqn::Calculator.calc('1 < 2')).to eq(true)
      expect(Eqn::Calculator.calc('2 < 1')).to eq(false)
    end

    it 'compares two numbers with >=' do
      expect(Eqn::Calculator.calc('2 >= 1')).to eq(true)
      expect(Eqn::Calculator.calc('2 >= 2')).to eq(true)
      expect(Eqn::Calculator.calc('1 >= 2')).to eq(false)
    end

    it 'compares two numbers with <=' do
      expect(Eqn::Calculator.calc('1 <= 2')).to eq(true)
      expect(Eqn::Calculator.calc('2 <= 2')).to eq(true)
      expect(Eqn::Calculator.calc('2 <= 1')).to eq(false)
    end

    it 'compares two numbers with =' do
      expect(Eqn::Calculator.calc('1 = 1')).to eq(true)
      expect(Eqn::Calculator.calc('1 = 2')).to eq(false)
    end

    it 'compares two numbers with ==' do
      expect(Eqn::Calculator.calc('1 == 1')).to eq(true)
      expect(Eqn::Calculator.calc('1 == 2')).to eq(false)
    end

    it 'compares two numbers with 1=' do
      expect(Eqn::Calculator.calc('2 != 1')).to eq(true)
      expect(Eqn::Calculator.calc('2 != 2')).to eq(false)
    end

    it 'compares two groups' do
      expect(Eqn::Calculator.calc('(2 + 2) > (2 + 1)')).to eq(true)
      expect(Eqn::Calculator.calc('(2 + 1) > (2 + 2)')).to eq(false)
    end
  end
end
