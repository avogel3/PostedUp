@posts
Feature:
    Users should be able to add, update, and delete their own posts.

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
      And     I click "Publish Now"
      And     I click "Activity Feed"
      Then    I should see "New Ruby Post"

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
