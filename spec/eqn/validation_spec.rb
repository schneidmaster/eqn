describe Eqn do
  context 'when assessing a valid equation' do
    it_behaves_like 'correctly assesses validity', eqn: '1+1', expected_result: true
  end

  context 'when assessing an invalid equation' do
    it_behaves_like 'correctly assesses validity', eqn: '(1)1', expected_result: false
    it_behaves_like 'correctly raises error', eqn: '(1)1', expected_error: Eqn::ParseError
    it_behaves_like 'correctly assesses validity', eqn: '1 / /', expected_result: false
    it_behaves_like 'correctly raises error', eqn: '1 / /', expected_error: Eqn::ParseError
  end

  context 'when assessing whitespace' do
    context 'when equation has whitespace' do
      it_behaves_like 'correctly assesses validity', eqn: ' 1 + ( 1 + 2 ) ', expected_result: true
    end

    context 'when equation has arbitrarily large whitespace' do
      it_behaves_like 'correctly assesses validity', eqn: '     1.5 + 3     ', expected_result: true
    end

    context 'when equation has tabs' do
      it_behaves_like 'correctly assesses validity', eqn: "\t1.5\t+\t3\t", expected_result: true
    end

    context 'when equation has tabs with spaces' do
      it_behaves_like 'correctly assesses validity', eqn: "\t\s1.5\s\t+\t\s3\s\t", expected_result: true
    end

    context 'when equation has whitespace between numbers' do
      it_behaves_like 'correctly assesses validity', eqn: '1 1', expected_result: false
      it_behaves_like 'correctly raises error', eqn: '1 1', expected_error: Eqn::ParseError
    end

    context 'when equation has whitespace between numbers and decimals' do
      it_behaves_like 'correctly assesses validity', eqn: '1 .1', expected_result: false
      it_behaves_like 'correctly raises error', eqn: '1 .1', expected_error: Eqn::ParseError
    end

    context 'when equation has whitespace between groups and numbers' do
      it_behaves_like 'correctly assesses validity', eqn: 'if(5 > 3, 1, 2) 2', expected_result: false
      it_behaves_like 'correctly raises error', eqn: 'if(5 > 3, 1, 2) 2', expected_error: Eqn::ParseError
    end
  end

  context 'when evaluating division by zero' do
    context 'when equation contains zero division by zero' do
      it_behaves_like 'correctly assesses validity', eqn: '0 / 0', expected_result: false
      it_behaves_like 'correctly raises error', eqn: '0 / 0', expected_error: Eqn::ZeroDivisionError
    end

    context 'when equation contains positive division by zero' do
      it_behaves_like 'correctly assesses validity', eqn: '1 / 0', expected_result: false
      it_behaves_like 'correctly raises error', eqn: '-1 / 0', expected_error: Eqn::ZeroDivisionError
    end

    context 'when equation contains negative division by zero' do
      it_behaves_like 'correctly assesses validity', eqn: '-1 / 0', expected_result: false
      it_behaves_like 'correctly raises error', eqn: '-1 / 0', expected_error: Eqn::ZeroDivisionError
    end

    context 'when equation contains division by zero within round function' do
      it_behaves_like 'correctly assesses validity', eqn: 'round(1 / 0)', expected_result: false
      it_behaves_like 'correctly raises error', eqn: 'round(1 / 0)', expected_error: Eqn::ZeroDivisionError
    end

    context 'when equation contains division by zero within roundup function' do
      it_behaves_like 'correctly assesses validity', eqn: 'roundup(1 / 0)', expected_result: false
      it_behaves_like 'correctly raises error', eqn: 'roundup(1 / 0)', expected_error: Eqn::ZeroDivisionError
    end

    context 'when equation contains division by zero within rounddown function' do
      it_behaves_like 'correctly assesses validity', eqn: 'rounddown(1 / 0)', expected_result: false
      it_behaves_like 'correctly raises error', eqn: 'rounddown(1 / 0)', expected_error: Eqn::ZeroDivisionError
    end
  end
end
