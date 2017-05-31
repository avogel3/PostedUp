@signup
Feature: Users can signup for an account with their name, email, and preferred timezone and password.

  Background:
    Given   I am on the new_user_registration page

  @javascript
  Scenario: User can sign up with valid credentials
    When    I, John Smith, fill out the sign_up form with user info
    Then    I should see "Welcome! You have signed up successfully"
    And     I should see "John Smith"

  @javascript
  Scenario: User cannot sign up without name
    When    I fill out the sign_up form with invalid_user info
    Then    I should see "Please review the problems below:"
