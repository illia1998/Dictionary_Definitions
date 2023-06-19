RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for' do
    context 'when retrieving definitions for a word' do
      include_examples 'valid user prompt', 'micromanagement', 'prompts for user input if term is not provided'
      include_examples 'valid user prompt', 'full-scale', 'prompts for user input if term is not provided'
    end
  end
end

RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for' do
    context 'when retrieving definitions for a word' do
      include_examples 'invalid user prompt', ' ', 'raises InvalidURLError for empty search', InvalidURLError
      include_examples 'invalid user prompt', nil, 'raises NotFoundError for nil', NotFoundError
    end
  end
end

