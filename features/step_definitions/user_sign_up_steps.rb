Given(/^I am on the (\w+) page$/) do |path|
  visit eval("#{path}_path")
end

When(/^I, (\w+) (\w+), fill out the sign_up form with user info$/) do |first_name, last_name|
    expect(page).to have_content "Sign up"
    fill_in "user[first_name]", with: first_name
    fill_in "user[last_name]", with: last_name
    fill_in "user[email]", with: Faker::Internet.email
    
    password = Faker::Internet.password(15)
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
    
    preferred_timezone = ActiveSupport::TimeZone.all.map(&:name).sample
    select preferred_timezone, from: "user[preferred_timezone]"
    page.save_screenshot
    click_on "Sign up"
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

When(/^I fill out the sign_up form with invalid_user info$/) do
  invalid_user = build(:invalid_user)
  fill_in "user[email]", with: invalid_user.email
  fill_in "user[password]", with: invalid_user.password
  fill_in "user[password_confirmation]", with: invalid_user.password_confirmation
  fill_in "user[first_name]", with: invalid_user.first_name
  fill_in "user[last_name]", with: invalid_user.last_name
  select invalid_user.preferred_timezone, from: "user[preferred_timezone]"
  click_on "Sign up"
end