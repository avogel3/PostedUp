# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  posted_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  user_id     :integer
#  post_status :integer
#

class Post < ApplicationRecord
    validates :title, :content, presence: true
    mount_uploader :image, ImageUploader
    enum post_status: [ :draft, :post_later, :posted ]
    belongs_to :user

    def self.schedule_post_job post
      PostLaterJob.set(wait_until: post.posted_date).perform_later(post_id)
    end
      
end
