describe Eqn do
  context 'performs basic arithmetic' do
    it 'performs basic addition' do
      expect(Eqn::Calculator.calc('1+1')).to eq(2)
      expect(Eqn::Calculator.calc('3+-1')).to eq(2)
      expect(Eqn::Calculator.calc('-3+1')).to eq(-2)
      expect(Eqn::Calculator.calc('-3+-1')).to eq(-4)
    end
    it 'performs basic subtraction' do
      expect(Eqn::Calculator.calc('5-3')).to eq(2)
      expect(Eqn::Calculator.calc('5--3')).to eq(8)
      expect(Eqn::Calculator.calc('-5-3')).to eq(-8)
      expect(Eqn::Calculator.calc('-5--3')).to eq(-2)
    end
    it 'performs basic multiplication' do
      expect(Eqn::Calculator.calc('2*4')).to eq(8)
      expect(Eqn::Calculator.calc('2*.4')).to eq(0.8)
      expect(Eqn::Calculator.calc('2*-4')).to eq(-8)
      expect(Eqn::Calculator.calc('-2*4')).to eq(-8)
      expect(Eqn::Calculator.calc('-2*-4')).to eq(8)
    end
    it 'performs basic division' do
      expect(Eqn::Calculator.calc('10/5')).to eq(2)
      expect(Eqn::Calculator.calc('10/-5')).to eq(-2)
      expect(Eqn::Calculator.calc('-10/5')).to eq(-2)
      expect(Eqn::Calculator.calc('-10/-5')).to eq(2)
    end
    it 'performs basic exponentiation' do
      expect(Eqn::Calculator.calc('2^3')).to eq(8)
      expect(Eqn::Calculator.calc('2^-3')).to eq(0.125)
      expect(Eqn::Calculator.calc('-2^3')).to eq(-8)
      expect(Eqn::Calculator.calc('-2^-3')).to eq(-0.125)
    end
  end

  context 'respects order of operations' do
    it 'performs multiplication before addition' do
      expect(Eqn::Calculator.calc('1 + 2 * 3')).to eq(7)
      expect(Eqn::Calculator.calc('2 * 2 + 3')).to eq(7)
    end
    it 'performs multiplication before subtraction' do
      expect(Eqn::Calculator.calc('10 - 2 * 3')).to eq(4)
      expect(Eqn::Calculator.calc('10 * 2 - 3')).to eq(17)
    end
    it 'performs division before addition' do
      expect(Eqn::Calculator.calc('1 + 6 / 3')).to eq(3)
      expect(Eqn::Calculator.calc('6 / 3 + 1')).to eq(3)
    end
    it 'performs division before subtraction' do
      expect(Eqn::Calculator.calc('4 - 6 / 3')).to eq(2)
      expect(Eqn::Calculator.calc('6 / 3 - 1')).to eq(1)
    end
    it 'performs exponentiation before multiplication' do
      expect(Eqn::Calculator.calc('2 ^ 2 * 3')).to eq(12)
      expect(Eqn::Calculator.calc('3 * 2 ^ 2')).to eq(12)
    end
    it 'performs exponentiation before division' do
      expect(Eqn::Calculator.calc('2 ^ 3 / 2')).to eq(4)
      expect(Eqn::Calculator.calc('2 / 2 ^ 3')).to eq(0.25)
    end
    it 'performs exponentiation before addition' do
      expect(Eqn::Calculator.calc('2 ^ 2 + 3')).to eq(7)
      expect(Eqn::Calculator.calc('3 + 2 ^ 2')).to eq(7)
    end
    it 'performs exponentiation before subtraction' do
      expect(Eqn::Calculator.calc('2 ^ 2 - 3')).to eq(1)
      expect(Eqn::Calculator.calc('5 - 2 ^ 2')).to eq(1)
    end
    it 'performs parenthesized addition before multiplication' do
      expect(Eqn::Calculator.calc('(2 + 2) * 3')).to eq(12)
      expect(Eqn::Calculator.calc('3 * (2 + 2)')).to eq(12)
    end
    it 'performs parenthesized subtraction before multiplication' do
      expect(Eqn::Calculator.calc('(5 - 2) * 3')).to eq(9)
      expect(Eqn::Calculator.calc('3 * (5 - 2)')).to eq(9)
    end
    it 'performs parenthesized addition before division' do
      expect(Eqn::Calculator.calc('(2 + 4) / 3')).to eq(2)
      expect(Eqn::Calculator.calc('12 / (2 + 4)')).to eq(2)
    end
    it 'performs parenthesized subtraction before division' do
      expect(Eqn::Calculator.calc('(8 - 2) / 3')).to eq(2)
      expect(Eqn::Calculator.calc('12 / (8 - 2)')).to eq(2)
    end
    it 'performs parenthesized addition before exponentiation' do
      expect(Eqn::Calculator.calc('(2 + 2) ^ 3')).to eq(64)
      expect(Eqn::Calculator.calc('3 ^ (2 + 1)')).to eq(27)
    end
    it 'performs parenthesized subtraction before exponentiation' do
      expect(Eqn::Calculator.calc('(5 - 2) ^ 3')).to eq(27)
      expect(Eqn::Calculator.calc('3 ^ (5 - 2)')).to eq(27)
    end
  end

  context 'respects associativity' do
    it 'performs subtraction left-associatively' do
      expect(Eqn::Calculator.calc('2 - 5 + 4')).to eq(1)
      expect(Eqn::Calculator.calc('5 - 4 - 3')).to eq(-2)
    end

    it 'performs division left-associatively' do
      expect(Eqn::Calculator.calc('2 / 5 * 4')).to eq(1.6)
      expect(Eqn::Calculator.calc('5 / 4 / 5')).to eq(0.25)
    end

    it 'performs exponentiation right-associatively' do
      expect(Eqn::Calculator.calc('2 ^ 3 ^ 2')).to eq(512)
    end
  end
end
