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

  @javscript
  Scenario: Users cannot view another user's draft post
    When    another user has a draft post titled "War and Peace, Cont."
    And     I try to view the post "War and Peace, Cont."
    Then    I should see "You are not authorized to access this page."

  @javascript @comments
  Scenario: Users can comment on another user's post.
    When    I try to view the post "War and Peace"
    And     I fill out the comment form
    Then    I should see "Your comment has been posted!"
    And     I should see my comment

  @javascript @comments
  Scenario: Users cannot post an empty comment on another user's post
    When    I try to view the post "War and Peace"
    And     I click "Create Comment"
    Then    I should see "Content can't be blank"
