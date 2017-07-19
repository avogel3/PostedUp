class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :title, :posted_date
  belongs_to :user
  has_many :comments
end
