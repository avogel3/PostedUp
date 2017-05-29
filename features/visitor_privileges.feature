@visitors
Feature:
  Visitors should be unable to access to the same views as users.
  Visitors should not be able to create, edit, update, or destroy posts.
  Visitors should not see the same navigation as users.

  Background:
    Given I am on the root page

  Scenario: Visitors should see a "No posts yet.." when there are no published posts
    Then I should see "No posts yet.."

  Scenario: Visitors cannot see the user dropdown
    Then I should not see the CSS ID user_menu

  Scenario: Visitors should see the Sign In Button
    Then I should see "Sign In"

  Scenario: Visitors should be able to get to the sign up page
    When I click "Sign In"
    Then I should see "Sign up"
    When I click "Sign up"
    Then I should see the CSS Class sign_up_form

  Scenario: Visitors should not see the My Posts link
    Then I should not see "My Posts"

  Scenario: Visitors should not the New Post button
    Then I should not see "New Post"

  Scenario: Visitors should not see the Post edit buttons
    When a user creates a public post
    And I refresh the page
    Then I should not see "Edit"
    Then I should not see "Destroy"

  Scenario: Visitors should be able to view a post
    When a user creates a public post
    And I refresh the page
    Then I should see "View Post"
    When I click "View Post"
    Then I should not see "Edit"
