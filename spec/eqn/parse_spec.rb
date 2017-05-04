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
end
