class PostSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :id, :content, :title, :posted_date, :image
  belongs_to :user
  has_many :comments

  def content
    markdown(object.content)
  end

  def posted_date
    object.posted_date.strftime('%m/%d/%Y %l:%M %p')
  end

  def image
    object.image.url
  end
end
