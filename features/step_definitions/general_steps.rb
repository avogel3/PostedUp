Given(/^I am on the (\w+) page$/) do |path|
  visit eval("#{path}_path")
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^I click "([^"]*)"$/) do |text|
  click_on text
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content(content)
end

Given(/^I am logged in$/) do
  steps %Q{
    And     I am on the root page
    And     I click "Sign In"
    When    I fill out the login form with user info
    Then    I should see "Signed in successfully."
  }
end

When(/^I create a draft post$/) do
  steps %Q{
    When    I am on the new_post page
    And     I create a public_post with title "New Ruby Post"
    Then    I should see "Post was successfully created."
  }
end

When(/^I should see post access options\.$/) do
  steps %Q{
    Then    I should see "Edit"
    And     I should see "Delete"
  }
end
