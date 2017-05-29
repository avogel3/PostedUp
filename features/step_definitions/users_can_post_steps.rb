Given(/^I am logged in$/) do
    steps %Q{
        And     I am on the root page
        And     I click "Sign In"
        When    I fill out the login form with user info
        Then    I should see "Signed in successfully."
    }
end

When(/^I create a public_post with title "([^"]*)"$/) do |title|
    post = attributes_for(:draft, title: title)
    post.each do |key, value|
        eval("fill_in 'post[#{key}]', with: '#{value}'")
    end
    click_on "Create Post"
end


When(/^I create a draft post$/) do
  steps %Q{
    When    I am on the new_post page
    And     I create a public_post with title "New Ruby Post"
    Then    I should see "Post was successfully created."
  }
end

When(/^I edit the post (\w+) with "([^"]*)"$/) do |key, value|
    eval("fill_in 'post[#{key}]', with: '#{value}'") 
    click_on "Update"
end