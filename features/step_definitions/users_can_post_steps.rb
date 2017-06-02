When(/^I create a public_post with title "([^"]*)"$/) do |title|
  fill_in "post[title]", with: title
  fill_in "post[content]", with: Faker::Markdown.random
  click_on "Create Post"
end

When(/^I edit the post (\w+) with "([^"]*)"$/) do |key, value|
  eval("fill_in 'post[#{key}]', with: '#{value}'")
  click_on "Update"
end

When(/^I schedule it to post later$/) do
  @selected_time = Faker::Time.forward(5, :all).strftime("%b %d %Y %H:%M")
  fill_in "post[posted_date]", with: @selected_time
  click_on "Update Post"
end

Then(/^the post should be added to the queue$/) do
  expect(enqueued_jobs.size).to eq 1
end

Then(/^the posted date should match my time relative to my timezone$/) do
  post = Post.find_by_title("New Ruby Post")
  user_tz = post.user.preferred_timezone
  Time.use_zone(user_tz) do
    @posted_time = post.posted_date.strftime("%b %d %Y %H:%M")
  end

  expect(@selected_time).to eq @posted_time
end

Then(/^the posted date should not be nil$/) do
  post = Post.find_by_title("New Ruby Post")
  expect(post.posted_date).not_to be nil
end
