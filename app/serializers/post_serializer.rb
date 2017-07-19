class PostSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :id, :content, :title, :posted_date
  belongs_to :user
  has_many :comments

  def content
    markdown(object.content)
  end
end
