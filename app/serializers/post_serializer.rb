class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :posted_date

  def content
    markdown(object.content) if object.content
  end

  def posted_date
    object.posted_date.strftime('%m-%d-%Y %H:%M %p') if object.posted_date
  end
end
