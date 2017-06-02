json.posts @posts do |post|
  json.(post, :title, :content)
  json.author post.user.display_name
  json.posted_date parse_time_for_post(post.posted_date, post.user.preferred_timezone)
  json.image post.image_url
  json.content post.content
end

json.links do
  json.pages! @posts, url: "#{Rails.application.secrets.host_url}/posts"
end
