describe Eqn do
  context 'checks equation validity' do
    it 'affirms a valid equation' do
      expect(Eqn::Calculator.valid?('1+1')).to eq(true)
    end

    it 'rejects an invalid equation' do
      expect(Eqn::Calculator.valid?('(1)1')).to eq(false)
      expect { Eqn::Calculator.calc('(1)1') }.to raise_error(Eqn::ParseError)
      expect(Eqn::Calculator.valid?('1 / /')).to eq(false)
      expect { Eqn::Calculator.calc('1 / /') }.to raise_error(Eqn::ParseError)
    end
  end

  context 'appropriately handles whitespace' do
    it 'ignores whitespace in an equation' do
      expect(Eqn::Calculator.valid?(' 1 + ( 1 + 2 ) ')).to eq(true)
    end

    it 'ignores arbitrarily large whitespace' do
      expect(Eqn::Calculator.valid?('     1.5 + 3     ')).to eq(true)
    end

    it 'ignores tabs' do
      expect(Eqn::Calculator.valid?("\t1.5\t+\t3\t")).to eq(true)
    end

    it 'ignores tabs with spaces' do
      expect(Eqn::Calculator.valid?("\t\s1.5\s\t+\t\s3\s\t")).to eq(true)
    end

    it 'does not ignore whitespace between numbers' do
      expect(Eqn::Calculator.valid?('1 1')).to eq(false)
      expect { Eqn::Calculator.calc('1 1') }.to raise_error(Eqn::ParseError)
    end

    it 'does not ignore whitespace between numbers and decimals' do
      expect(Eqn::Calculator.valid?('1 .1')).to eq(false)
      expect { Eqn::Calculator.calc('1 .1') }.to raise_error(Eqn::ParseError)
    end

    it 'does not ignore whitespace between groups and numbers' do
      expect(Eqn::Calculator.valid?('if(5 > 3, 1, 2) 2')).to eq(false)
      expect { Eqn::Calculator.calc('if(5 > 3, 1, 2) 2') }.to raise_error(Eqn::ParseError)
    end
  end

  context 'division by zero' do
    it 'throws exception for zero division by zero' do
      expect(Eqn::Calculator.valid?('0 / 0')).to eq(false)
      expect { Eqn::Calculator.calc('0 / 0') }.to raise_error(Eqn::ZeroDivisionError)
    end

    it 'throws exception for positive division by zero' do
      expect(Eqn::Calculator.valid?('1 / 0')).to eq(false)
      expect { Eqn::Calculator.calc('-1 / 0') }.to raise_error(Eqn::ZeroDivisionError)
    end

    it 'throws exception for negative division by zero' do
      expect(Eqn::Calculator.valid?('-1 / 0')).to eq(false)
      expect { Eqn::Calculator.calc('-1 / 0') }.to raise_error(Eqn::ZeroDivisionError)
    end

    it 'throws exception for division by zero within round function' do
      expect(Eqn::Calculator.valid?('round(1 / 0)')).to eq(false)
      expect { Eqn::Calculator.calc('round(1 / 0)') }.to raise_error(Eqn::ZeroDivisionError)
    end

    it 'throws exception for division by zero within roundup function' do
      expect(Eqn::Calculator.valid?('roundup(1 / 0)')).to eq(false)
      expect { Eqn::Calculator.calc('roundup(1 / 0)') }.to raise_error(Eqn::ZeroDivisionError)
    end

    it 'throws exception for division by zero within rounddown function' do
      expect(Eqn::Calculator.valid?('rounddown(1 / 0)')).to eq(false)
      expect { Eqn::Calculator.calc('rounddown(1 / 0)') }.to raise_error(Eqn::ZeroDivisionError)
    end
  end
end
