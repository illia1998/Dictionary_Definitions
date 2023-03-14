require_relative 'support/require_support'

# base clazz to look up definitions for words
class DictionaryDefinitions
  attr_reader :opts, :term

  def initialize(opts)
    @opts = opts
  end

  def definition_for(term = nil)
    !term && puts('Find definition for:'.colorize(:magenta))
    @term = (term || gets).to_s.chomp.downcase
    generate_results
  end

  def random_definition
    puts 'Looking for a random word:'.colorize(:magenta)
    @term = Faker::Noun.base
    puts @term.colorize(:blue)
    generate_results
  end

  def generate_results
    raise(InvalidParameterError, opts) unless parameter_exist?

    fetch_data && search_definitions
  end

  private

  def fetch_data
    raise NotImplementedError, "You must implement '#{__method__}' method!"
  end
end
