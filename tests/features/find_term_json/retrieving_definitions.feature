Feature: As a user, I want to look up definitions of a word from dictionary

  Scenario: Retrieving noun definitions of a word
    Given I search a noun definitions for eternity via api
    Then the output should be:
    """
    1) Existence without end, infinite time.
    2) Existence outside of time.
    3) A period of time which extends infinitely far into the future.
    4) (metaphysical) The remainder of time that elapses after death.
    5) A comparatively long time.
    """

  Scenario: Retrieving origin definitions of a word
    Given I search a synonym definitions for ability via api
    Then the output should be:
    """
    1) aptitude
    2) cleverness
    3) dexterity
    4) talent
    5) capability
    6) capacity
    7) faculty
    8) aptitude
    9) aptness
    10) capability
    11) capacity
    12) faculty
    """

  Scenario: Retrieving idiom definitions of a word
    Given I search a audio definitions for aluminium via api
    Then the output should be:
    """
    1) https://api.dictionaryapi.dev/media/pronunciations/en/aluminium-au.mp3
    2) https://api.dictionaryapi.dev/media/pronunciations/en/aluminium-uk.mp3
    3) https://api.dictionaryapi.dev/media/pronunciations/en/aluminium-us.mp3
    """

  Scenario Outline: Verifying word definition retrieval for case-variant input
    Given I search a <word_type> definitions for <word> via api
    Then the search should return at least one definition
    And each definition is printed in correct format
    Examples:
      | word_type | word           |
      | noun      | merry-go-round |
      | synonym   | HOUSE          |
      | audio     | CoFfee         |

