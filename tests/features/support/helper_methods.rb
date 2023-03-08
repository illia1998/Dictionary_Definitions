module HelperMethods
  def sanitize_output(output)
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
    sanitize_output(result)
  end

  def capture_search_random_output(word_type)
    result = capture(:stdout) do
      search_random(word_type)
    end
    sanitize_output(result)
  end

  def expect_search_to_raise_error(word, word_type)
    expect { search(word, word_type) }.to(raise_error { |e| @error = e })
  end
end
