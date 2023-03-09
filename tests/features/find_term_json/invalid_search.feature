Feature: As a user, I want to receive appropriate error messages when search is invalid

  Scenario Outline: Using invalid parameters to search a word
    Given I search a non-existing <word_type> definitions for <word> via api
    Then I should see appropriate error message
    Examples:
      | word      | word_type |
      | imprion   | noun      |
      | rain      | idiom     |
      | molish    | audio     |
      | democracy | origin    |
      | relish    | synonym   |