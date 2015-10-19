describe Eqn do
  context 'evaluates functions' do
    it 'evaluates the if function' do
      expect(Eqn::Calculator.calc('if(5 > 3, 1, 2)')).to eq(1)
      expect(Eqn::Calculator.calc('if(3 > 5, 1, 2)')).to eq(2)
    end

    it 'evaluates the round function' do
      expect(Eqn::Calculator.calc('round(1.75)')).to eq(2)
      expect(Eqn::Calculator.calc('round(1.5)')).to eq(2)
      expect(Eqn::Calculator.calc('round(1.25)')).to eq(1)
    end

    it 'evaluates the roundup function' do
      expect(Eqn::Calculator.calc('roundup(1.75)')).to eq(2)
      expect(Eqn::Calculator.calc('roundup(1.5)')).to eq(2)
      expect(Eqn::Calculator.calc('roundup(1.25)')).to eq(2)
    end

    it 'evaluates the rounddown function' do
      expect(Eqn::Calculator.calc('rounddown(1.75)')).to eq(1)
      expect(Eqn::Calculator.calc('rounddown(1.5)')).to eq(1)
      expect(Eqn::Calculator.calc('rounddown(1.25)')).to eq(1)
    end

    it 'evaluates function results in mathematical operations' do
      expect(Eqn::Calculator.calc('if(5 > 3, 1, 2) + 1')).to eq(2)
      expect(Eqn::Calculator.calc('1 + if(5 > 3, 1, 2)')).to eq(2)
    end
  end
end
