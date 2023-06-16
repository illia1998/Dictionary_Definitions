RSpec.shared_examples 'valid request' do |word_type, word, description|
  subject { described_class.new(word_type) }

  it description do
    allow_any_instance_of(described_class).to receive(:puts)
    result = subject.definition_for(word)
    expect(result).to be_an(Array)
    expect(result).not_to be_empty
  end
end

RSpec.shared_examples 'invalid request' do |word_type, word, description, error|
  subject { described_class.new(word_type) }

  it description do
    allow_any_instance_of(described_class).to receive(:puts)
    expect { subject.definition_for(word) }.to raise_error(error)
  end
end

RSpec.shared_examples 'valid user prompt' do |word, description, _error|
  subject { described_class.new(:sense) }

  it description do
    allow(subject).to receive(:puts)
    allow(subject).to receive(:gets).and_return(word)

    expect(subject).to receive(:gets)

    subject.definition_for

    expect(subject.term).to eq(word)
  end
end

RSpec.shared_examples 'invalid user prompt' do |word, description, error|
  subject { described_class.new(:sense) }

  it description do
    allow(subject).to receive(:puts)
    allow(subject).to receive(:gets).and_return(word)

    expect { subject.definition_for(word) }.to raise_error(error)
  end
end

RSpec.shared_examples 'valid request random' do |word_type, description|
  subject { described_class.new(word_type) }

  it description do
    allow_any_instance_of(described_class).to receive(:puts)
    result = subject.random_definition
    expect(result).to be_an(Array)
    expect(result).not_to be_empty
  end
end
