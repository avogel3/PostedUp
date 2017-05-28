# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  posted_date :datetime
#  published   :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Post < ApplicationRecord
    validates :title, :content, presence: true
    mount_uploader :image, ImageUploader
end
