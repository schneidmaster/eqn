describe Eqn do
  context 'when evaluating the if function' do
    it_behaves_like 'correctly evaluates', eqn: 'if(5 > 3, 1, 2)', expected_result: 1
    it_behaves_like 'correctly evaluates', eqn: 'if(3 > 5, 1, 2)', expected_result: 2
  end

  context 'when evaluating the round function' do
    it_behaves_like 'correctly evaluates', eqn: 'round(1.75)', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: 'round(1.5)', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: 'round(1.25)', expected_result: 1
  end

  context 'when evaluating the round function with decimals' do
    it_behaves_like 'correctly evaluates', eqn: 'round(1.75, 1)', expected_result: 1.8
    it_behaves_like 'correctly evaluates', eqn: 'round(1.74, 1)', expected_result: 1.7
    it_behaves_like 'correctly evaluates', eqn: 'round(1.7, 1)', expected_result: 1.7
    it_behaves_like 'correctly evaluates', eqn: 'round(1.7, 2)', expected_result: 1.7
  end

  context 'when evaluating the roundup function' do
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.75)', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.5)', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.25)', expected_result: 2
  end

  context 'when evaluating the roundup function with decimals' do
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.75, 1)', expected_result: 1.8
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.74, 1)', expected_result: 1.8
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.7, 1)', expected_result: 1.7
    it_behaves_like 'correctly evaluates', eqn: 'roundup(1.7, 2)', expected_result: 1.7
  end

  context 'when evaluating the rounddown function' do
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.75)', expected_result: 1
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.5)', expected_result: 1
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.25)', expected_result: 1
  end

  context 'when evaluating the rounddown function with decimals' do
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.75, 1)', expected_result: 1.7
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.74, 1)', expected_result: 1.7
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.7, 1)', expected_result: 1.7
    it_behaves_like 'correctly evaluates', eqn: 'rounddown(1.7, 2)', expected_result: 1.7
  end

  context 'when evaluating function results in mathematical operations' do
    it_behaves_like 'correctly evaluates', eqn: 'if(5 > 3, 1, 2) + 1', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '1 + if(5 > 3, 1, 2)', expected_result: 2
  end
end
