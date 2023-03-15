class BaseCommand
  def initialize(receiver)
    @receiver = receiver
  end

  def execute
    raise NotImplementedError, "You must implement #{__method__}"
  end
end
