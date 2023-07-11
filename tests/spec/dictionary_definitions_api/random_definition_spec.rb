RSpec.describe DictionaryDefinitionsApi do
  context '#random_definition', :random do
    context 'when looking up the random word' do
      include_examples 'valid request random', :noun, 'returns an array of definitions for a noun'
      include_examples 'valid request random', :synonym, 'returns an array of synonyms'
      include_examples 'valid request random', :audio, 'returns an array of audios'
    end
  end
end

RSpec.describe DictionaryDefinitionsApi do
  subject { described_class.new(:noun) }

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

