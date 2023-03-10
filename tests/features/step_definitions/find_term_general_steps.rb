Given('I search a {word_type} definitions for {word} via {dictionary_type}') do |word_type, word, dictionary_type|
  @query = dictionary_type.new(word_type)
  @search_result = capture_search_output(word)
end

Given('I search a random word {word_type} definitions via {dictionary_type}') do |word_type, dictionary_type|
  @query = dictionary_type.new(word_type)
  @search_result = capture_search_random_output
end

Given('I search a non-existing {word_type} definitions for {word} via {dictionary_type}') do |word_type, word, dictionary_type|
  @query = dictionary_type.new(word_type)
  expect_search_to_raise_error(word)
end

Then(/^the output should be:$/) do |text|
  expect(@search_result).to eq(text)
end

And(/^the search should return at least one definition$/) do
  expect(@search_result).not_to be_nil
end

Then(/^each definition is printed in correct format$/) do
  expect(@search_result).to match(/^\d+\) (.+)/)
end

Then('I should see appropriate error message') do
  @logger.error(@error.message)
end

