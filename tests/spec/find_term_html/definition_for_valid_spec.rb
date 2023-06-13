require_relative '../../../bin/find_term_html'

RSpec.shared_examples 'valid request' do |word_type, word, description|
  subject { described_class.new(word_type) }

  it description do
    allow_any_instance_of(described_class).to receive(:puts)
    result = subject.definition_for(word)
    expect(result).to be_an(Array)
    expect(result).not_to be_empty
  end
end

RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for' do
    context 'when looking up the sense of a word' do
      include_examples 'valid request', :sense, 'surface', 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :sense, 'DAM', 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :sense, 'CaMeL', 'returns an array of definitions for mixed-case word'
      include_examples 'valid request', :sense, 'world-famous', 'returns an array of definitions for hyphenated word'
    end

    context 'when retrieving the idiom for a valid request' do
      include_examples 'valid request', :idiom, 'rain', 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :idiom, 'BRIDGE', 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :idiom, 'wAtEr', 'returns an array of definitions for mixed-case word'
    end

    context 'when retrieving the origin of a valid request' do
      include_examples 'valid request', :origin, 'mirror', 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :origin, 'SANDWICH', 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :origin, 'NighTmare', 'returns an array of definitions for mixed-case word'
    end
  end
end
