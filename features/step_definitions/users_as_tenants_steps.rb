Given(/^another user has a post titled "([^"]*)"$/) do |title|
  user = create(:user)
  user.posts.create(attributes_for(:public_post, title: title))
end

When(/^I try to edit the post "([^"]*)"$/) do |title|
  post = Post.find_by_title(title)
  visit edit_post_path(post)
end

When(/^I try to delete the post "([^"]*)"$/) do |title|
  post = Post.find_by_title(title)
  visit post_path(post, {:method => :delete})
end

When(/^I try to view the post "([^"]*)"$/) do |title|
  post = Post.find_by_title(title)
  visit post_path(post)
end

When(/^I fill out the comment form$/) do
  @comment = Faker::StarWars.quote
  fill_in "comment[content]", with: @comment
  click_on "Create Comment"
end

Then(/^I should see my comment$/) do
  steps %Q{
    And    I should see "#{@comment}"
  }
end
