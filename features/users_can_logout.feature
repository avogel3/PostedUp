Feature:
  Users should be able to logout of the app.

  Background:
    Given   I, John Smith, am a user
    And     I am logged in

  @javascript @logout
  Scenario: User can logout
    When    I logout with the dropdown-menu
    Then    I should see "Signed out successfully."
