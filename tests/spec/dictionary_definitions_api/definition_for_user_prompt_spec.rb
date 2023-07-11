RSpec.describe DictionaryDefinitionsApi do
  context '#definition_for', :user_prompt do
    context 'when retrieving definitions with valid user input' do
      include_examples 'valid user prompt', :noun, 'prompts for user input if term is not provided'
      include_examples 'valid user prompt', :synonym, 'prompts for user input if term is not provided'
    end

    context 'when retrieving definitions with invalid user input' do
      include_examples 'invalid user prompt', :noun, 'raises error for invalid input'
      include_examples 'invalid user prompt', :audio, 'raises error for invalid input'
    end
  end
end



