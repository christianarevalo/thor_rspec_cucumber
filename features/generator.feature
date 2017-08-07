Feature: Generating recipes
  In order to generate many files
  As a CLI user
  I want foodie to generate recipes files

  Scenario: Recipes
    When I run `foodie recipe dinner steak`
    Then the following files should exist:
      | Files Generated |
      | dinner/steak_instructions.txt |
      | dinner/steak_ingredients.txt |
    Then the file "dinner/steak_instructions.txt" should contain:
      """
      ##### Instructions #####
      Tips on how to make delicious steak go here.
      """
    Then the file "dinner/steak_ingredients.txt" should contain:
      """
      ##### Ingredients #####
      Ingredients for delicious steak go here.
      """