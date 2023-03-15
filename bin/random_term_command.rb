require_relative 'base_command'

class RandomDefinitionCommand < BaseCommand
  def execute
    @receiver.random_definition
  end
end
