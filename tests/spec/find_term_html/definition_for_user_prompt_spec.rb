require_relative '../../../bin/find_term_html'

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

RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for' do
    context 'when retrieving definitions for a word' do
      include_examples 'valid user prompt', 'micromanagement', 'prompts for user input if term is not provided'
    end
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

RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for' do
    context 'when retrieving definitions for a word' do
      include_examples 'invalid user prompt', ' ', 'raises InvalidURLError for invalid search', InvalidURLError
      include_examples 'invalid user prompt', nil, 'raises NotFoundError for empty search', NotFoundError
    end
  end
end

