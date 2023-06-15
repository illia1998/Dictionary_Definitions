require_relative '../../../bin/find_term_html'

RSpec.shared_examples 'valid request' do |word_type, description|
  subject { described_class.new(word_type) }

  it description do
    allow_any_instance_of(described_class).to receive(:puts)
    result = subject.random_definition
    expect(result).to be_an(Array)
    expect(result).not_to be_empty
  end
end

RSpec.describe DictionaryDefinitionsParse do
  context '#random_definition_' do
    context 'when looking up the sense of a word' do
      include_examples 'valid request', :sense, 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :sense, 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :sense, 'returns an array of definitions for mixed-case word'
      include_examples 'valid request', :sense, 'returns an array of definitions for hyphenated word'
    end

    context 'when retrieving the idiom for a valid request' do
      include_examples 'valid request', :idiom, 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :idiom, 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :idiom, 'returns an array of definitions for mixed-case word'
    end

    context 'when retrieving the origin of a valid request' do
      include_examples 'valid request', :origin, 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :origin, 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :origin, 'returns an array of definitions for mixed-case word'
    end
  end
end

RSpec.describe DictionaryDefinitionsParse do
  it 'fetches words from RandomWord module' do

  end
end
