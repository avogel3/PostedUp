Then(/^I should not see the CSS (\w+) (\w+)$/) do |type, selector|
  class_or_id = (type.downcase == "class") ? '.' : '#'
  expect(page).not_to have_css("#{class_or_id}#{selector}")
end

Then(/^I should see the CSS (\w+) (\w+)$/) do |type, selector|
  class_or_id = (type.downcase == "class") ? '.' : '#'
  expect(page).to have_css("#{class_or_id}#{selector}")
end

When(/^a user creates a public post$/) do
  user = create(:user)
  post = user.posts.create!(attributes_for(:public_post))
  expect(Post.last.title).to eq post.title
end

When(/^I refresh the page$/) do
  visit current_path
end
