require_relative 'support/require_support'

# base clazz to look up definitions for any word
class DictionaryDefinitions
  attr_reader :opts, :term

  def initialize(opts)
    @opts = opts
  end

  def definition_for(term = nil)
    !term && puts('Find definition for:'.colorize(:magenta))
    @term = (term || gets).to_s.chomp.downcase
    query
  end

  def random_definition
    puts 'Looking for a random word:'.colorize(:magenta)
    @term = Spicy::Proton.noun
    puts @term.colorize(:blue)
    query
  end

  def print_output(*doc)
    parameter_exist? ? search_with_param(*doc) : raise(InvalidParameterError, opts)
  end

  private

  def query
    raise NotImplementedError, "You must implement 'query' method!"
  end

  def connection
    raise NotImplementedError, "You must implement 'connection' method!"
  end
end
