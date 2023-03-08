Given('I search a {word_type_html} definitions for {word}') do |word_type, word|
  @search_result = capture_search_output(word, word_type)
end

Then(/^the output should be:$/) do |text|
  expect(@search_result).to eq(text)
end

Given('I search a random word {word_type_html} definitions') do |word_type|
  @search_result = capture_search_random_output(word_type)
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

Given('I search a non-existing {word_type_html} definitions for {word}') do |word_type, word|
  expect_search_to_raise_error(word, word_type)
end
