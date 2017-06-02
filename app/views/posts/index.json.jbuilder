# json.array! @posts, partial: 'posts/post', as: :post
json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.content post.content
  json.posted_date parse_time_for_post(post.posted_date, post.user.preferred_timezone)
  json.post_status post.post_status
  json.author post.user.display_name
end
