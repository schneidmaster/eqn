shared_examples 'correctly evaluates' do |eqn:, expected_result:, vars: {}|
  it "returns expected result for #{eqn}" do
    expect(Eqn::Calculator.calc(eqn, vars)).to eq(expected_result)
  end
end

shared_examples 'correctly assesses validity' do |eqn:, expected_result:, vars: {}|
  verb = expected_result ? 'affirm' : 'refute'
  it "#{verb}s validity of #{eqn}" do
    expect(Eqn::Calculator.valid?(eqn, vars)).to eq(expected_result)
  end
end

shared_examples 'correctly raises error' do |eqn:, expected_error:, vars: {}|
  it "raises expected error for #{eqn}" do
    expect { Eqn::Calculator.calc(eqn, vars) }.to raise_error(expected_error)
  end
end
