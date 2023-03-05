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


