RSpec.describe DictionaryDefinitionsApi do
  context '#definition_for' do
    context 'when retrieving definitions with invalid parameter', :invalid_parameter_error do
      include_examples 'invalid request', :sense, 'longitude', 'raises InvalidParameterError for existing word with invalid parameter', InvalidParameterError
      include_examples 'invalid request', :origin, 'palace', 'raises InvalidParameterError for existing word with invalid parameter', InvalidParameterError
      include_examples 'invalid request', :video, 'quqwu', 'raises InvalidParameterError for non-existing word with invalid parameter', InvalidParameterError
      include_examples 'invalid request', :adverb, 'browiz', 'raises InvalidParameterError for non-existing word with invalid parameter', InvalidParameterError
    end

    context 'when retrieving definitions for non-existing word', :no_match_error do
      include_examples 'invalid request', :noun, 'aperia', 'raises NoExactMatchError for non-existing word', NoExactMatchError
      include_examples 'invalid request', :noun, 'qunat', 'raises NoExactMatchError for non-existing word', NoExactMatchError
      include_examples 'invalid request', :synonym, 'vsaawd', 'raises NoExactMatchError for non-existing word', NoExactMatchError
      include_examples 'invalid request', :audio, 'smosith', 'raises NoExactMatchError for non-existing word', NoExactMatchError
    end

    context 'when retrieving definitions for non-word inputs', :no_exact_match_error do
      include_examples 'invalid request', :noun, '1234', 'raises NoExactMatchError for numbers', NoExactMatchError
      include_examples 'invalid request', :audio, '.,*&', 'raises NoExactMatchError for special symbols', NoExactMatchError
      include_examples 'invalid request', :synonym, '@email', 'raises NoExactMatchError for word with special symbols', NoExactMatchError
      include_examples 'invalid request', :noun, '', 'raises NoExactMatchError for empty search', NoExactMatchError

    end

    context 'when retrieving definitions for word with no results found', :not_found_error do
      include_examples 'invalid request', :synonym, 'old-fashioned', 'raises NotFoundError if none synonyms found', NotFoundError
      include_examples 'invalid request', :audio, 'clusters', 'raises NotFoundError if audio not found', NotFoundError
    end

    context 'when retrieving definitions with invalid input', :invalid_url_error do
      include_examples 'invalid request', :noun, '#%!<>{', 'raises InvalidURLError for excluded symbols', InvalidURLError
      include_examples 'invalid request', :noun, '""', 'raises InvalidURLError for excluded symbols', InvalidURLError
      include_examples 'invalid request', :noun, ' ', 'raises InvalidURLError for empty space', InvalidURLError
      include_examples 'invalid request', :noun, nil, 'raises InvalidURLError for nil', InvalidURLError
    end
  end
end

