class PostSerializer < ActiveModel::Serializer
  include ApplicationHelper

  attributes :id, :title, :content, :image, :author, :posted_at

  def posted_at
    parse_time_for_post(object.posted_at, object.user.preferred_timezone)
  end

  def image
    object.image.url
  end
end
