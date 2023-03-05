Feature: As a user, I want to look up random word definitions from dictionary
# TODO: make the scenario valid and stable
  Scenario Outline: Retrieving random word definitions
    Given I search a random word <Word_type>
    Then the search should return at least one definition
    And each definition is printed in correct format

    Examples:
      | Word_type |
      | noun      |
      | origin    |
      | idiom     |
