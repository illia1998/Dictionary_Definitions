module HelperMethods
  def sanitize_output(output)
    output.gsub(/\e\[([;\d]+)?m/, '').chomp
  end

  def search(word)
    @query.definition_for(word)
  end

  def search_random
    @query.random_definition
  end

  def capture_search_output(word)
    result = capture(:stdout) do
      search(word)
    end
    sanitize_output(result)
  end

  def capture_search_random_output
    result = capture(:stdout) do
      search_random
    end
    sanitize_output(result)
  end

  def expect_search_to_raise_error(word)
    expect { search(word) }.to(raise_error { |e| @error = e })
  end
end
