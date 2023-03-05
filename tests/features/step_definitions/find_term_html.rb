Given('I search a {word_type_html} definitions for {word}') do |word_type, word|
  @search_result = capture_search_output(word, word_type)
end

Then(/^the output should be:$/) do |text|
  expect(@search_result).to eq(text)
end

Given('I search a random word {word_type_html}') do |word_type|
  @search_result_random = capture_search_random_output(word_type)
end

And(/^the search should return at least one definition$/) do
  expect(@search_result_random).not_to be_nil
end

Then(/^each definition is printed in correct format$/) do
  expect(@search_result_random).to match(/^\d+\) (.+)/)
end

Given('I search a {word_type_html} definitions for word {word}') do |word_type, word|

end

Then('I should see appropriate error message') do

end