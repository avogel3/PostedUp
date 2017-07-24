class PostSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :id, :title, :content, :posted_date, :image

  def image
    object.image_url
  end

  def content
    markdown(object.content) if object.content
  end

  def posted_date
    object.posted_date.strftime('%m-%d-%Y %H:%M %p') if object.posted_date
  end
end
