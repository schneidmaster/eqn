require 'spec_helper'

describe Eqn do
  context 'parses numbers' do
    it 'parses a positive integer' do
      expect(Eqn::Calculator.calc('1')).to eq(1)
    end
    it 'parses a negative integer' do
      expect(Eqn::Calculator.calc('-1')).to eq(-1)
    end
    it 'parses a positive float' do
      expect(Eqn::Calculator.calc('1.5')).to eq(1.5)
    end
    it 'parses a negative float' do
      expect(Eqn::Calculator.calc('-1.5')).to eq(-1.5)
    end
    it 'parses a positive integer positive integer exponent' do
      expect(Eqn::Calculator.calc('2e5')).to eq(200_000)
    end
    it 'parses a positive integer negative integer exponent' do
      expect(Eqn::Calculator.calc('2e-5')).to eq(0.00002)
    end
    it 'parses a positive float positive integer exponent' do
      expect(Eqn::Calculator.calc('2.5e5')).to eq(250_000)
    end
    it 'parses a positive float negative integer exponent' do
      expect(Eqn::Calculator.calc('2.5e-5')).to eq(0.000025)
    end
    it 'parses a negative integer positive integer exponent' do
      expect(Eqn::Calculator.calc('-2e5')).to eq(-200_000)
    end
    it 'parses a negative integer negative integer exponent' do
      expect(Eqn::Calculator.calc('-2e-5')).to eq(-0.00002)
    end
    it 'parses a negative float positive integer exponent' do
      expect(Eqn::Calculator.calc('-2.5e5')).to eq(-250_000)
    end
    it 'parses a negative float negative integer exponent' do
      expect(Eqn::Calculator.calc('-2.5e-5')).to eq(-0.000025)
    end
    it 'parses a positive integer positive float exponent' do
      expect(Eqn::Calculator.calc('2e1.5')).to eq(63.245553203367585)
    end
    it 'parses a positive integer negative float exponent' do
      expect(Eqn::Calculator.calc('2e-1.5')).to eq(0.06324555320336758)
    end
    it 'parses a positive float positive float exponent' do
      expect(Eqn::Calculator.calc('2.5e1.5')).to eq(79.05694150420948)
    end
    it 'parses a positive float negative float exponent' do
      expect(Eqn::Calculator.calc('2.5e-1.5')).to eq(0.07905694150420947)
    end
    it 'parses a negative integer positive float exponent' do
      expect(Eqn::Calculator.calc('-2e1.5')).to eq(-63.245553203367585)
    end
    it 'parses a negative integer negative float exponent' do
      expect(Eqn::Calculator.calc('-2e-1.5')).to eq(-0.06324555320336758)
    end
    it 'parses a negative float positive float exponent' do
      expect(Eqn::Calculator.calc('-2.5e1.5')).to eq(-79.05694150420948)
    end
    it 'parses a negative float negative float exponent' do
      expect(Eqn::Calculator.calc('-2.5e-1.5')).to eq(-0.07905694150420947)
    end
    it 'parses a positive float with no leading number' do
      expect(Eqn::Calculator.calc('.1')).to eq(0.1)
    end
    it 'parses a negative float with no leading number' do
      expect(Eqn::Calculator.calc('-.1')).to eq(-0.1)
    end
    it 'parses a positive exponent with no leading number' do
      expect(Eqn::Calculator.calc('.1e.1')).to eq(0.12589254117941673)
    end
    it 'parses a negative exponent with no leading number' do
      expect(Eqn::Calculator.calc('.1e-.1')).to eq(0.07943282347242815)
    end
  end

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
