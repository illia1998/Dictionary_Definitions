RSpec::Matchers.define :be_a_non_empty_array do
  match do |actual|
    expect(actual).to be_an(Array)
    expect(actual).not_to be_empty
  end
end
