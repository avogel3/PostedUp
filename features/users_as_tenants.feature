@tenants
Feature:
  The idea is that Users are tenants of this blog.
  Users should not be able to edit another user's posts.
  Users should not be able to destroy another user's posts.
  Users should not be able to view another user's draft posts.
  Users can comment on another user's post.

  Background:
    Given   I, John Smith, am a user
    And     I am logged in
    And     another user has a post titled "War and Peace"

  @javascript
  Scenario: Users cannot edit another user's post.
    When    I try to edit the post "War and Peace"
    Then    I should see "You are not authorized to access this page."

  @javascript
  Scenario: Users can view another user's public post
    When    I try to view the post "War and Peace"
    Then    I should not see "You are not authorized to access this page."
    And     I should see "War and Peace"

  @javascript
  Scenario: Users can comment on another user's post.
    When
