Feature: As a user, I want to receive appropriate error messages when search is invalid
#TODO: implement step definitions
  Scenario Outline: Using invalid parameters to search a word
    Given I search a <Word_type> definitions for word <Word>
    Then I should see appropriate error message
    Examples:
      | Word | Word_type |
      | dou  | noun      |
      | ruby | idiom     |
      | dog  | verb      |