module HelperMethods
  def format_output(output)
    output.gsub(/\e\[([;\d]+)?m/, '').chomp
  end

  def search(word, word_type)
    DictionaryDefinitionsParse.new(word_type).definition_for(word)
  end

  def search_random(word_type)
    DictionaryDefinitionsParse.new(word_type).random_definition
  end

  def capture_search_output(word, word_type)
    result = capture(:stdout) do
      search(word, word_type)
    end
    format_output(result)
  end

  def capture_search_random_output(word_type)
    result = capture(:stdout) do
      search_random(word_type)
    end
    format_output(result)
  end
end
