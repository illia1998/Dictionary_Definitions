@negative
Feature: As a user, I want to receive appropriate error messages when search is invalid
#TODO: add third column with expected
  Scenario Outline: Using invalid parameters to search a word
    Given I search a non-existing <word_type> definitions for <word> via parse
    Then I should see appropriate <error_type> error message
    Examples:
      | word      | word_type | error_type            |
      | stample   | sense     | NoExactMatchError     |
      | ruby      | idiom     | NotFoundError         |
      | worldwide | synonym   | InvalidParameterError |
      | wortunde  | origin    | NoExactMatchError     |
      | exciting  | audio     | InvalidParameterError |