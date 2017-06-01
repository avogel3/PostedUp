json.extract! post, :id, :created_at, :updated_at, :title, :content, :image
json.url post_url(post, format: :json)
