RSpec.describe DictionaryDefinitionsApi do
  context '#definition_for' do
    context 'when retrieving the noun for a valid request', :valid_noun do
      include_examples 'valid request', :noun, 'underground', 'returns an array of definitions for lowercase word'
      include_examples 'valid request', :noun, 'HILL', 'returns an array of definitions for uppercase word'
      include_examples 'valid request', :noun, 'sNake', 'returns an array of definitions for mixed-case word'
      include_examples 'valid request', :noun, 'city-state', 'returns an array of definitions for hyphenated word'
    end

    context 'when retrieving the synonym for a valid request', :valid_synonym do
      include_examples 'valid request', :synonym, 'student', 'returns an array of synonyms for lowercase word'
      include_examples 'valid request', :synonym, 'SERENDIPITY', 'returns an array of synonyms for uppercase word'
      include_examples 'valid request', :synonym, 'eLoQuEnT', 'returns an array of synonyms for mixed-case word'
    end

    context 'when retrieving the audio of a valid request', :valid_audio do
      include_examples 'valid request', :audio, 'coffee', 'returns an array of audios for lowercase word'
      include_examples 'valid request', :audio, 'COOKIE', 'returns an array of audios for uppercase word'
      include_examples 'valid request', :audio, 'cAR', 'returns an array of audios for mixed-case word'
    end
  end
end

