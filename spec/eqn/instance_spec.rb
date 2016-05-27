describe Eqn do
  describe 'instance' do
    subject { Eqn::Calculator.new(eqn).calc }

    context 'performs basic arithmetic' do
      context 'performs basic addition' do
        let(:eqn) { '1+1' }

        it 'returns expected result' do
          expect(subject).to eq(2.0)
        end
      end

      context 'performs basic subtraction' do
        let(:eqn) { '5-3' }

        it 'returns expected result' do
          expect(subject).to eq(2.0)
        end
      end

      context 'performs basic multiplication' do
        let(:eqn) { '2*3' }

        it 'returns expected result' do
          expect(subject).to eq(6.0)
        end
      end

      context 'performs basic division' do
        let(:eqn) { '6/2' }

        it 'returns expected result' do
          expect(subject).to eq(3.0)
        end
      end

      context 'performs basic exponentiation' do
        let(:eqn) { '2^3' }

        it 'returns expected result' do
          expect(subject).to eq(8.0)
        end
      end
    end
  end

  context 'sets var after initialization' do
    subject { Eqn::Calculator.new('abc+1') }

    before { subject.set(:abc, 2) }

    it 'returns expected result' do
      expect(subject.calc).to eq(3.0)
    end
  end

  context 'sets var by hash after initialization' do
    subject { Eqn::Calculator.new('abc+1') }

    before { subject.set(abc: 2) }

    it 'returns expected result' do
      expect(subject.calc).to eq(3.0)
    end
  end

  describe 'instance with vars' do
    subject { Eqn::Calculator.new('variable + 1', variable: 3).calc }

    it 'evaluates variables in arithmetic' do
      expect(subject).to eq(4.0)
    end
  end
end
