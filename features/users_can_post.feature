@posts
Feature:
  Users should be able to add, update, delete, and schedule their own posts.

  Background:
    Given   I, John Smith, am a user
    And     I am logged in

  @javascript
  Scenario: User creates a draft post
    When    I am on the new_post page
    And     I create a public_post with title "New Ruby Post"
    Then    I should see "Post was successfully created."
    When    I click "My Posts"
    Then    I should see "New Ruby Post"

  @javascript
  Scenario: User creates a public post
    When    I create a draft post
    And     I click "Post Now"
    And     I click "Activity Feed"
    Then    I should see "New Ruby Post"
    When    I click "New Ruby Post"
    And     I should see post access options.

  @javascript
  Scenario: User edits a post
    When    I create a draft post
    And     I click "Edit"
    And     I edit the post title with "Lorem Ipsum."
    Then    I should see "Post was successfully updated."
    And     I should see "Lorem Ipsum."

  @javascript
  Scenario: User deletes a post
    When    I create a draft post
    And     I click "Delete"
    Then    I should see "Post was successfully deleted."

  @javascript
  Scenario: User can access their post
    When    I create a draft post
    And     I click "My Posts"
    And     I click "New Ruby Post"
    Then    I should not see "You are not authorized to access this page."

  @javascript @publish
  Scenario: User can schedule a post publishing
    When    I create a draft post
    And     I schedule it to post later
    Then    I should see "Post was successfully updated."
    And     the post should be added to the queue
    And     the posted_date should match my time relative to my timezone
