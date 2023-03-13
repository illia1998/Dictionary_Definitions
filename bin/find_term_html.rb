#!/usr/bin/env ruby
require_relative '../support/require_support'

# this clazz helps to look up definitions for any word via HTML
class DictionaryDefinitionsParse < DictionaryDefinitions
  OXFORD_DICTIONARY_URL = 'https://www.oxfordlearnersdictionaries.com/definition/english'.freeze

  private

  def query
    response = connection
    doc = parse_html(response)
    print_results(doc)
  end

  def connection
    conn = Faraday.new(OXFORD_DICTIONARY_URL)
    endpoint = conn.get("#{term}_1", { q: term })
    endpoint = conn.get(term, { q: term }) unless endpoint.success?
    endpoint.success? ? endpoint : raise(NoExactMatchError, term)
  end

  def parse_html(response)
    Nokogiri::HTML(response.body)
  end

  def parameter_exist?
    OPTS.key?(opts)
  end

  def search_with_param(doc)
    definitions = extract_definitions(doc, OPTS[opts])
    raise(NotFoundError, term) if definitions.empty?

    print_definitions(definitions)
  end

  def extract_definitions(doc, xpath)
    doc.xpath(xpath).map(&:text)
  end

  def print_definitions(definitions)
    definitions.each.with_index(1) do |text, i|
      puts "#{i}) #{text}"
    end
  end
end

DictionaryDefinitionsParse.new(:idiom).definition_for
DictionaryDefinitionsParse.new(:idiom).random_definition


