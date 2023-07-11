@negative
Feature: As a user, I want to receive appropriate error messages when search is invalid

  Scenario Outline: Using invalid parameters to search a word
    Given I search a non-existing <word_type> definitions for <word> via api
    Then I should see appropriate <error_type> error message
    Examples:
      | word      | word_type | error_type            |
      | imprion   | noun      | NoExactMatchError     |
      | rain      | idiom     | InvalidParameterError |
      | molish    | audio     | NoExactMatchError     |
      | democracy | origin    | InvalidParameterError |
      | relish    | synonym   | NotFoundError         |