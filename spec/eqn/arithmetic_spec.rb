describe Eqn do
  context 'when performing basic addition' do
    it_behaves_like 'correctly evaluates', eqn: '1+1', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '3+-1', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '-3+1', expected_result: -2
    it_behaves_like 'correctly evaluates', eqn: '-3+-1', expected_result: -4
  end

  context 'when performing basic subtraction' do
    it_behaves_like 'correctly evaluates', eqn: '5-3', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '5--3', expected_result: 8
    it_behaves_like 'correctly evaluates', eqn: '-5-3', expected_result: -8
    it_behaves_like 'correctly evaluates', eqn: '-5--3', expected_result: -2
  end

  context 'when performing basic multiplication' do
    it_behaves_like 'correctly evaluates', eqn: '2*4', expected_result: 8
    it_behaves_like 'correctly evaluates', eqn: '2*.4', expected_result: 0.8
    it_behaves_like 'correctly evaluates', eqn: '2*-4', expected_result: -8
    it_behaves_like 'correctly evaluates', eqn: '-2*4', expected_result: -8
    it_behaves_like 'correctly evaluates', eqn: '-2*-4', expected_result: 8
  end

  context 'when performing basic division' do
    it_behaves_like 'correctly evaluates', eqn: '10/5', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '10/-5', expected_result: -2
    it_behaves_like 'correctly evaluates', eqn: '-10/5', expected_result: -2
    it_behaves_like 'correctly evaluates', eqn: '-10/-5', expected_result: 2
  end

  context 'when performing basic exponentiation' do
    it_behaves_like 'correctly evaluates', eqn: '2^3', expected_result: 8
    it_behaves_like 'correctly evaluates', eqn: '2^-3', expected_result: 0.125
    it_behaves_like 'correctly evaluates', eqn: '-2^3', expected_result: -8
    it_behaves_like 'correctly evaluates', eqn: '-2^-3', expected_result: -0.125
  end

  context 'when evaluating explicitly signed positive integers' do
    it_behaves_like 'correctly evaluates', eqn: '+1+1', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '+3+-1', expected_result: 2
    it_behaves_like 'correctly evaluates', eqn: '-3++1', expected_result: -2
    it_behaves_like 'correctly evaluates', eqn: '-3+-1', expected_result: -4
  end

  context 'when evaluating order of operations' do
    context 'when performing multiplication before addition' do
      it_behaves_like 'correctly evaluates', eqn: '1 + 2 * 3', expected_result: 7
      it_behaves_like 'correctly evaluates', eqn: '2 * 2 + 3', expected_result: 7
    end

    context 'when performing multiplication before subtraction' do
      it_behaves_like 'correctly evaluates', eqn: '10 - 2 * 3', expected_result: 4
      it_behaves_like 'correctly evaluates', eqn: '10 * 2 - 3', expected_result: 17
    end

    context 'when performing division before addition' do
      it_behaves_like 'correctly evaluates', eqn: '1 + 6 / 3', expected_result: 3
      it_behaves_like 'correctly evaluates', eqn: '6 / 3 + 1', expected_result: 3
    end

    context 'when performing division before subtraction' do
      it_behaves_like 'correctly evaluates', eqn: '4 - 6 / 3', expected_result: 2
      it_behaves_like 'correctly evaluates', eqn: '6 / 3 - 1', expected_result: 1
    end

    context 'when performing exponentiation before multiplication' do
      it_behaves_like 'correctly evaluates', eqn: '2 ^ 2 * 3', expected_result: 12
      it_behaves_like 'correctly evaluates', eqn: '3 * 2 ^ 2', expected_result: 12
    end

    context 'when performing exponentiation before division' do
      it_behaves_like 'correctly evaluates', eqn: '2 ^ 3 / 2', expected_result: 4
      it_behaves_like 'correctly evaluates', eqn: '2 / 2 ^ 3', expected_result: 0.25
    end

    context 'when performing exponentiation before addition' do
      it_behaves_like 'correctly evaluates', eqn: '2 ^ 2 + 3', expected_result: 7
      it_behaves_like 'correctly evaluates', eqn: '3 + 2 ^ 2', expected_result: 7
    end

    context 'when performing exponentiation before subtraction' do
      it_behaves_like 'correctly evaluates', eqn: '2 ^ 2 - 3', expected_result: 1
      it_behaves_like 'correctly evaluates', eqn: '5 - 2 ^ 2', expected_result: 1
    end

    context 'when performing parenthesized addition before multiplication' do
      it_behaves_like 'correctly evaluates', eqn: '(2 + 2) * 3', expected_result: 12
      it_behaves_like 'correctly evaluates', eqn: '3 * (2 + 2)', expected_result: 12
    end

    context 'when performing parenthesized subtraction before multiplication' do
      it_behaves_like 'correctly evaluates', eqn: '(5 - 2) * 3', expected_result: 9
      it_behaves_like 'correctly evaluates', eqn: '3 * (5 - 2)', expected_result: 9
    end

    context 'when performing parenthesized addition before division' do
      it_behaves_like 'correctly evaluates', eqn: '(2 + 4) / 3', expected_result: 2
      it_behaves_like 'correctly evaluates', eqn: '12 / (2 + 4)', expected_result: 2
    end

    context 'when performing parenthesized subtraction before division' do
      it_behaves_like 'correctly evaluates', eqn: '(8 - 2) / 3', expected_result: 2
      it_behaves_like 'correctly evaluates', eqn: '12 / (8 - 2)', expected_result: 2
    end

    context 'when performing parenthesized addition before exponentiation' do
      it_behaves_like 'correctly evaluates', eqn: '(2 + 2) ^ 3', expected_result: 64
      it_behaves_like 'correctly evaluates', eqn: '3 ^ (2 + 1)', expected_result: 27
    end

    context 'when performing parenthesized subtraction before exponentiation' do
      it_behaves_like 'correctly evaluates', eqn: '(5 - 2) ^ 3', expected_result: 27
      it_behaves_like 'correctly evaluates', eqn: '3 ^ (5 - 2)', expected_result: 27
    end
  end

  context 'when evaluating associativity' do
    context 'when performing subtraction left-associatively' do
      it_behaves_like 'correctly evaluates', eqn: '2 - 5 + 4', expected_result: 1
      it_behaves_like 'correctly evaluates', eqn: '5 - 4 - 3', expected_result: -2
    end

    context 'when performing division left-associatively' do
      it_behaves_like 'correctly evaluates', eqn: '2 / 5 * 4', expected_result: 1.6
      it_behaves_like 'correctly evaluates', eqn: '5 / 4 / 5', expected_result: 0.25
    end

    context 'when performing exponentiation right-associatively' do
      it_behaves_like 'correctly evaluates', eqn: '2 ^ 3 ^ 2', expected_result: 512
    end
  end
end
