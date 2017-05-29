Given(/^I, (\w+) (\w+), am a user$/) do |first_name, last_name|
  @user = create(:user, first_name: first_name, last_name: last_name)
end

When(/^I fill out the login form with user info$/) do
  fill_in "user[email]", with: @user.email
  fill_in "user[password]", with: @user.password
  click_on "Log in"
end

When(/^I fill out the login form without password$/) do
  fill_in "user[email]", with: @user.email
  click_on "Log in"
end
