describe Eqn do
  shared_examples 'correctly calculates' do |expected_result:|
    it 'returns expected result' do
      expect(instance.calc).to eq(expected_result)
    end
  end

  shared_examples 'responds to var methods' do |var_name:, var_value:|
    it 'returns correct value when called' do
      expect(instance.send(var_name)).to eq(var_value)
    end

    it 'responds to var method' do
      expect(instance.respond_to?(var_name)).to eq(true)
    end
  end

  describe 'instance' do
    subject(:instance) { Eqn::Calculator.new(eqn) }

    context 'when performing basic addition' do
      let(:eqn) { '1+1' }

      it_behaves_like 'correctly calculates', expected_result: 2.0
    end

    context 'when performing basic subtraction' do
      let(:eqn) { '5-3' }

      it_behaves_like 'correctly calculates', expected_result: 2.0
    end

    context 'when performing basic multiplication' do
      let(:eqn) { '2*3' }

      it_behaves_like 'correctly calculates', expected_result: 6.0
    end

    context 'when performing basic division' do
      let(:eqn) { '6/2' }

      it_behaves_like 'correctly calculates', expected_result: 3.0
    end

    context 'when performing basic exponentiation' do
      let(:eqn) { '2^3' }

      it_behaves_like 'correctly calculates', expected_result: 8.0
    end

    context 'when given valid equation' do
      let(:eqn) { '1+1' }

      it 'affirms validity' do
        expect(instance.valid?).to eq(true)
      end
    end

    context 'when given invalid equation' do
      let(:eqn) { '1 / /' }

      it 'refutes validity' do
        expect(instance.valid?).to eq(false)
      end
    end
  end

  describe 'instance with vars set after initialization' do
    subject(:instance) { Eqn::Calculator.new('abc+1') }

    context 'when var is set by name' do
      before { instance.set(:abc, 2) }

      it_behaves_like 'correctly calculates', expected_result: 3.0
      it_behaves_like 'responds to var methods', var_name: :abc, var_value: 2
    end

    context 'when var is set by hash' do
      before { instance.set(abc: 2) }

      it_behaves_like 'correctly calculates', expected_result: 3.0
      it_behaves_like 'responds to var methods', var_name: :abc, var_value: 2
    end

    context 'when var is set by method' do
      before { instance.abc = 2 }

      it_behaves_like 'correctly calculates', expected_result: 3.0
      it_behaves_like 'responds to var methods', var_name: :abc, var_value: 2
    end

    context 'when nonexistent var is called by method' do
      it 'raises error' do
        expect { instance.abc }.to raise_error(NoMethodError)
      end
    end
  end

  describe 'instance with vars set at initialization' do
    subject(:instance) { Eqn::Calculator.new('abc+1', abc: 2) }

    it_behaves_like 'correctly calculates', expected_result: 3.0
    it_behaves_like 'responds to var methods', var_name: :abc, var_value: 2
  end
end
