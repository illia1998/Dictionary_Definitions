Feature: As a user, I want to look up noun definitions of a word from dictionary

  Scenario: Retrieving noun definitions of a word
    Given I search a noun definitions for dog
    Then the output should be:
    """
    1) an animal with four legs and a tail, often kept as a pet or trained for work, for example hunting or guarding buildings. There are many types of dog, some of which are wild.
    2) a male dog, fox, wolf or otter
    3) greyhound racing
    4) a thing of low quality; a failure
    5) an offensive way of describing a woman who is not considered attractive
    6) used, especially after an adjective, to describe a man who has done something bad
    """

  Scenario: Retrieving origin definitions of a word
    Given I search a origin definitions for hamburger
    Then the output should be:
    """
    1) late 19th cent. (originally US): from German Hamburg, a port in northern Germany.
    """

  Scenario: Retrieving idiom definitions of a word
    Given I search a idiom definitions for sun
    Then the output should be:
    """
    1) make hay while the sun shines
    2) a place in the sun
    3) under the sun
    4) with the sun
    """

  Scenario Outline: Verifying word definition retrieval for case-variant input
    Given I search a <word_type> definitions for <word>
    Then the search should return at least one definition
    And each definition is printed in correct format
    Examples:
      | word_type | word          |
      | noun      | mother-in-law |
      | idiom     | CaT           |
      | origin    | MAGNET        |

