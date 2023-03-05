class EnglishDictionaryError < StandardError; end

class NoExactMatchError < EnglishDictionaryError
  def initialize(term)
    super("No exact match found for “#{term}” in English")
  end
end

class NotFoundError < EnglishDictionaryError
  def initialize(term)
    super("Sorry, pal, nothing was found for “#{term}”")
  end
end

class InvalidParameterError < EnglishDictionaryError
  def initialize(parameter)
    super("Wrong parameter: #{parameter}")
  end
end
