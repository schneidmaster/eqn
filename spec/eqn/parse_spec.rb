describe Eqn do
  context 'when parsing a positive integer' do
    it_behaves_like 'correctly evaluates', eqn: '1', expected_result: 1
  end

  context 'when parsing a negative integer' do
    it_behaves_like 'correctly evaluates', eqn: '-1', expected_result: -1
  end

  context 'when parsing a positive float' do
    it_behaves_like 'correctly evaluates', eqn: '1.5', expected_result: 1.5
  end

  context 'when parsing a negative float' do
    it_behaves_like 'correctly evaluates', eqn: '-1.5', expected_result: -1.5
  end

  context 'when parsing a positive integer positive integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2e5', expected_result: 200_000
  end

  context 'when parsing a positive integer negative integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2e-5', expected_result: 0.00002
  end

  context 'when parsing a positive float positive integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2.5e5', expected_result: 250_000
  end

  context 'when parsing a positive float negative integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2.5e-5', expected_result: 0.000025
  end

  context 'when parsing a negative integer positive integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2e5', expected_result: -200_000
  end

  context 'when parsing a negative integer negative integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2e-5', expected_result: -0.00002
  end

  context 'when parsing a negative float positive integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2.5e5', expected_result: -250_000
  end

  context 'when parsing a negative float negative integer exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2.5e-5', expected_result: -0.000025
  end

  context 'when parsing a positive integer positive float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2e1.5', expected_result: 63.245553203367585
  end

  context 'when parsing a positive integer negative float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2e-1.5', expected_result: 0.06324555320336758
  end

  context 'when parsing a positive float positive float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2.5e1.5', expected_result: 79.05694150420948
  end

  context 'when parsing a positive float negative float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '2.5e-1.5', expected_result: 0.07905694150420947
  end

  context 'when parsing a negative integer positive float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2e1.5', expected_result: -63.245553203367585
  end

  context 'when parsing a negative integer negative float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2e-1.5', expected_result: -0.06324555320336758
  end

  context 'when parsing a negative float positive float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2.5e1.5', expected_result: -79.05694150420948
  end

  context 'when parsing a negative float negative float exponent' do
    it_behaves_like 'correctly evaluates', eqn: '-2.5e-1.5', expected_result: -0.07905694150420947
  end

  context 'when parsing a positive float with no leading number' do
    it_behaves_like 'correctly evaluates', eqn: '.1', expected_result: 0.1
  end

  context 'when parsing a negative float with no leading number' do
    it_behaves_like 'correctly evaluates', eqn: '-.1', expected_result: -0.1
  end

  context 'when parsing a positive exponent with no leading number' do
    it_behaves_like 'correctly evaluates', eqn: '.1e.1', expected_result: 0.12589254117941673
  end

  context 'when parsing a negative exponent with no leading number' do
    it_behaves_like 'correctly evaluates', eqn: '.1e-.1', expected_result: 0.07943282347242815
  end
end
