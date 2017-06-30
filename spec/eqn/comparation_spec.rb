describe Eqn do
  context 'when comparing two numbers with >' do
    it_behaves_like 'correctly evaluates', eqn: '2 > 1', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '1 > 2', expected_result: false
  end

  context 'when comparing two numbers with <' do
    it_behaves_like 'correctly evaluates', eqn: '1 < 2', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '2 < 1', expected_result: false
  end

  context 'when comparing two numbers with >=' do
    it_behaves_like 'correctly evaluates', eqn: '2 >= 1', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '2 >= 2', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '1 >= 2', expected_result: false
  end

  context 'when comparing two numbers with <=' do
    it_behaves_like 'correctly evaluates', eqn: '1 <= 2', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '2 <= 2', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '2 <= 1', expected_result: false
  end

  context 'when comparing two numbers with =' do
    it_behaves_like 'correctly evaluates', eqn: '1 = 1', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '1 = 2', expected_result: false
  end

  context 'when comparing two numbers with ==' do
    it_behaves_like 'correctly evaluates', eqn: '1 == 1', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '1 == 2', expected_result: false
  end

  context 'when comparing two numbers with !=' do
    it_behaves_like 'correctly evaluates', eqn: '2 != 1', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '2 != 2', expected_result: false
  end

  context 'when comparing two groups' do
    it_behaves_like 'correctly evaluates', eqn: '(2 + 2) > (2 + 1)', expected_result: true
    it_behaves_like 'correctly evaluates', eqn: '(2 + 1) > (2 + 2)', expected_result: false
  end
end
