require_relative 'support/require_support'

# base clazz to look up definitions for any word
class DictionaryDefinitions
  attr_reader :opts

  def initialize(opts)
    @opts = opts
  end

  def definition_for(term = nil)
    unless term
      puts 'Find definition for:'.colorize(:magenta)
      term = gets.to_s.chomp.downcase
    end
    query(term)
  end

  def random_definition
    puts 'Looking for a random word:'.colorize(:magenta)
    rand_term = Spicy::Proton.noun
    puts rand_term.colorize(:blue)
    query(rand_term)
  end

  def print_output(*doc, term)
    parameter_exist? ? search_with_param(*doc, term) : raise(InvalidParameterError, opts)
  end

  private

  def query(term)
    raise NotImplementedError, "You must implement 'query' method!"
  end

  def connection(term)
    raise NotImplementedError, "You must implement 'connection' method!"
  end
end
