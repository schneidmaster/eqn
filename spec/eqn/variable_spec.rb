describe Eqn do
  context 'when evaluating variables in arithmetic' do
    it_behaves_like 'correctly evaluates', eqn: 'a + 1', vars: { a: 1 }, expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '-a * 5', vars: { a: 2 }, expected_result: -10
    it_behaves_like 'correctly evaluates', eqn: '-5 * a', vars: { a: 2 }, expected_result: -10
    it_behaves_like 'correctly evaluates', eqn: '3 * a', vars: { a: 2.5 }, expected_result: 7.5
  end

  context 'when variables are used in functions' do
    it_behaves_like 'correctly evaluates', eqn: 'if(a > b, c, d)', vars: { a: 2, b: 1, c: -5, d: 5 }, expected_result: -5
  end

  context 'when variable is used in wrong context' do
    it_behaves_like 'correctly assesses validity', eqn: 'a.1', vars: { a: 1 }, expected_result: false
    it_behaves_like 'correctly raises error', eqn: 'a.1', vars: { a: 1 }, expected_error: Eqn::ParseError
  end

  context 'when variable value is non-numeric' do
    it_behaves_like 'correctly assesses validity', eqn: 'a + 1', vars: { a: 'string' }, expected_result: false
    it_behaves_like 'correctly raises error', eqn: 'a + 1', vars: { a: 'string' }, expected_error: Eqn::NonNumericVariableError
    it_behaves_like 'correctly assesses validity', eqn: 'a + 1', vars: { a: {} }, expected_result: false
    it_behaves_like 'correctly raises error', eqn: 'a + 1', vars: { a: {} }, expected_error: Eqn::NonNumericVariableError
  end

  context 'when variable value not given' do
    it_behaves_like 'correctly assesses validity', eqn: 'a + 1', expected_result: false
    it_behaves_like 'correctly raises error', eqn: 'a + 1', expected_error: Eqn::NoVariableValueError
  end
end
