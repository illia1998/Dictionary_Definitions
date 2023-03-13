#!/usr/bin/env ruby
require_relative '../support/require_support'

# this clazz helps to look up definitions for any word via JSON
class DictionaryDefinitionsApi < DictionaryDefinitions
  DICTIONARY_API_URL = 'https://api.dictionaryapi.dev/api/v2/entries/en/'.freeze
  include SearchParameters

  private

  def query
    response = connection
    @parsed_response = JSON.parse(response.body)
    print_results
  end

  def connection
    conn = Faraday.new(DICTIONARY_API_URL)
    endpoint = conn.get(term)
    endpoint.success? ? endpoint : raise(NoExactMatchError, term)
  end

  def search_with_param
    raise(NotFoundError, term) if method(opts).call.empty?
  end

  def parameter_exist?
    respond_to?(opts)
  end
end

# DictionaryDefinitionsApi.new(:noun).definition_for