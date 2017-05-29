When(/^I logout with the dropdown\-menu$/) do
  find('a.dropdown-toggle').click
  click_on 'Logout'
end
