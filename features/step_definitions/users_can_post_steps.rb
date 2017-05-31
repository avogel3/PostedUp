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

When(/^I schedule it to post later$/) do
  @selected_time = (Time.zone.tomorrow + 6.hours).strftime("%m/%d/%y %H:%M")
  fill_in "post[posted_date]", with: @selected_time
  click_on "Update Post"
end

Then(/^the post should be added to the queue$/) do
  expect(enqueued_jobs.size).to eq 1
end
