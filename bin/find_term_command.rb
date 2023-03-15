require_relative 'base_command'

class FindTermCommand < BaseCommand
  def initialize(receiver, term)
    super(receiver)
    @term = term
  end

  def execute
    @receiver.definition_for(@term)
  end
end
