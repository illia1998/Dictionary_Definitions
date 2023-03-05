#!/usr/bin/env ruby
require_relative '../support/require_support'

# this clazz helps to look up definitions for any word via HTML
class DictionaryDefinitionsParse < DictionaryDefinitions
  OXFORD_DICTIONARY_URL = 'https://www.oxfordlearnersdictionaries.com/definition/english'.freeze

  private

  def query
    response = connection
    doc = Nokogiri::HTML(response.body)
    print_output(doc)
  end

  def connection
    conn = Faraday.new(OXFORD_DICTIONARY_URL)
    endpoint = conn.get("#{term}_1", { q: term })
    endpoint = conn.get(term, { q: term }) unless endpoint.success?
    endpoint.success? ? endpoint : raise(NoExactMatchError, term)
  end

  def parse_input(input, xpath)
    input.xpath(xpath).map(&:text).each.with_index(1) do |text, i|
      puts "#{i}) #{text}"
    end
  end

  def search_with_param(doc)
    raise(NotFoundError, term) if parse_input(doc, OPTS[opts]).empty?
  end

  def parameter_exist?
    OPTS.key?(opts)
  end
end

DictionaryDefinitionsParse.new(:noun).definition_for
DictionaryDefinitionsParse.new(:noun).random_definition
