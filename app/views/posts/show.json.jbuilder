json.(@post, :title, :content)
json.author @post.user.display_name
json.posted_date parse_time_for_post(@post.posted_date, @post.user.preferred_timezone)
json.image @post.image_url
