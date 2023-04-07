#!/usr/bin/env ruby
require_relative '../support/require_support'

# this clazz helps to look up definitions for words via JSON
class DictionaryDefinitionsApi < DictionaryDefinitions
  DICTIONARY_API_URL = 'https://api.dictionaryapi.dev/api/v2/entries/en/'.freeze
  include SearchParameters

  private

  def fetch_data
    response = connection
    @parsed_response = parse_json(response)
  end

  def connection
    conn = Faraday.new(DICTIONARY_API_URL)
    endpoint = conn.get(term)
    endpoint.success? ? endpoint : raise(NoExactMatchError, term)
  end

  def parse_json(response)
    JSON.parse(response.body)
  end

  def parameter_exist?
    respond_to?(opts)
  end

  def search_definitions
    raise(NotFoundError, term) if method(opts).call.empty?
  end
end

# DictionaryDefinitionsApi.new(:noun).definition_for
