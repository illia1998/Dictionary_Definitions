RSpec.describe DictionaryDefinitionsParse do
  context '#random_definition', :random do
    context 'when looking up the random word' do
      include_examples 'valid request random', :sense, 'returns an array of definitions for a word'
      include_examples 'valid request random', :idiom, 'returns an array of idioms for a word'
      include_examples 'valid request random', :origin, 'returns an array of origins for a word'
    end
  end
end

RSpec.describe DictionaryDefinitionsParse do
  subject { described_class.new(:origin) }

  context '#random_definition', :random do
    it 'fetches words from RandomWord module' do
      allow_any_instance_of(described_class).to receive(:puts)
      data = RandomWord::Noun.send(:data)
      noun_list = data['en']['nouns']['base']

      subject.random_definition
      definition = subject.term

      expect(noun_list).to include(definition)
    end
  end
end
