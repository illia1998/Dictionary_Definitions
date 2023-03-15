require_relative 'find_term_html'
require_relative 'find_term_json'
require_relative '../support/require_support'

class Client
  def initialize
    @commands = {}
  end

  def register(name, command)
    @commands[name] = command
  end

  def execute(name, *args)
    command = @commands[name]
    return puts "Command '#{name}' not found" unless command

    command.call(*args)
  end
end

client = Client.new

# Register the commands
client.register('html_definition', lambda do |word_type, word = nil|
  DictionaryDefinitionsParse.new(word_type).definition_for(word)
end)

client.register('html_random', lambda do |word_type|
  DictionaryDefinitionsParse.new(word_type).random_definition
end)

client.register('api_definition', lambda do |word_type, word = nil|
  DictionaryDefinitionsApi.new(word_type).definition_for(word)
end)

client.register('api_random', lambda do |word_type|
  DictionaryDefinitionsApi.new(word_type).random_definition
end)

# Execute the commands
client.execute('html_definition', :sense, 'dog')
client.execute('html_random', :origin)
client.execute('api_definition', :synonym, 'cat')
client.execute('api_random', :audio)
