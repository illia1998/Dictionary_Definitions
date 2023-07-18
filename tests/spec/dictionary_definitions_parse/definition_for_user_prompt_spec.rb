RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for', :user_prompt do
    context 'when retrieving definitions with valid user input' do
      include_examples 'valid user prompt', :sense, 'prompts for user input if term is not provided'
      include_examples 'valid user prompt', :idiom, 'prompts for user input if term is not provided'
    end

    context 'when retrieving definitions with invalid user input' do
      include_examples 'invalid user prompt', :sense, 'raises error for invalid input'
      include_examples 'invalid user prompt', :origin, 'raises error for invalid input'
    end
  end
end




