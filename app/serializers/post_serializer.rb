class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :author
end
