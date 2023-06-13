require_relative '../../../bin/find_term_html'

RSpec.shared_examples 'invalid request' do |word_type, word, description, error|
  subject { described_class.new(word_type) }

  it description do
    allow_any_instance_of(described_class).to receive(:puts)
    expect { subject.definition_for(word) }.to raise_error(error)
  end
end

RSpec.describe DictionaryDefinitionsParse do
  context '#definition_for' do
    context 'when retrieving definitions with invalid parameter' do
      include_examples 'invalid request', :verb, 'cat', 'raises InvalidParameterError for existing word with invalid parameter', InvalidParameterError
      include_examples 'invalid request', :noun, 'dog', 'raises InvalidParameterError for existing word with invalid parameter', InvalidParameterError
      include_examples 'invalid request', :audio, 'dldkdqw', 'raises InvalidParameterError for non-existing word with invalid parameter', InvalidParameterError
      include_examples 'invalid request', :senses, 'veles', 'raises InvalidParameterError for non-existing word with invalid parameter', InvalidParameterError
    end

    context 'when retrieving definitions for non-existing word ' do
      include_examples 'invalid request', :sense, 'sqwdqwd', 'raises NoExactMatchError for non-existing word', NoExactMatchError
      include_examples 'invalid request', :sense, 'roril', 'raises NoExactMatchError for non-existing word', NoExactMatchError
      include_examples 'invalid request', :idiom, 'treev', 'raises NoExactMatchError for non-existing word', NoExactMatchError
      include_examples 'invalid request', :origin, 'sebrar', 'raises NoExactMatchError for non-existing word', NoExactMatchError
    end

    context 'when retrieving definitions for non-word inputs' do
      include_examples 'invalid request', :sense, '9303', 'raises NoExactMatchError for numbers', NoExactMatchError
      include_examples 'invalid request', :sense, '--()__', 'raises NoExactMatchError for special symbols', NoExactMatchError
      include_examples 'invalid request', :sense, '@email', 'raises NoExactMatchError for word with special symbols', NoExactMatchError

    end

    context 'when retrieving definitions for word with no results found' do
      include_examples 'invalid request', :sense, '', 'raises NotFoundError for empty search', NotFoundError
      include_examples 'invalid request', :idiom, 'old-fashioned', 'raises NotFoundError if none idioms found', NotFoundError
      include_examples 'invalid request', :origin, 'masterpiece', 'raises NotFoundError if word origin not found', NotFoundError
    end

    context 'when retrieving definitions with invalid input' do
      include_examples 'invalid request', :sense, '>>{{', 'raises InvalidURLError for excluded symbols', InvalidURLError
      include_examples 'invalid request', :sense, '""', 'raises InvalidURLError for excluded symbols', InvalidURLError
      include_examples 'invalid request', :sense, nil, 'raises InvalidURLError for nil', InvalidURLError
      include_examples 'invalid request', :sense, ' ', 'raises InvalidURLError for empty space', InvalidURLError

    end
  end
end
