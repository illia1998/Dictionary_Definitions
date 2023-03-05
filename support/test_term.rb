class Testing
  attr_reader :term

  def initialize
    puts 'Looking definition for:'
    @term = gets.to_s.chomp
  end

  def definition
    puts term
  end
end

Testing.new.definition
