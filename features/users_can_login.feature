@auth
Feature:
  Users should be able to login with their email address and password.

  Background:
    Given   I, John Smith, am a user
    And     I am on the root page
    And     I click "Sign In"

  @javascript
  Scenario: User logs in with valid credentials
    When    I fill out the login form with user info
    Then    I should see "Signed in successfully."
    And     I should see "John Smith"
    And     I should not see "Sign In"

  @javascript
  Scenario: User cannot login without password
    When    I fill out the login form without password
    Then    I should see "Invalid Email or password."
