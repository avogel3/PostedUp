When(/^I create a public_post with title "([^"]*)"$/) do |title|
  post = attributes_for(:draft, title: title)
  post.each do |key, value|
    eval("fill_in 'post[#{key}]', with: '#{value}'")
  end
  click_on "Create Post"
end

When(/^I edit the post (\w+) with "([^"]*)"$/) do |key, value|
  eval("fill_in 'post[#{key}]', with: '#{value}'")
  click_on "Update"
end
