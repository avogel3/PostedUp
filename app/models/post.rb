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
#  post_status :integer          default("0")
#

class Post < ApplicationRecord
    validates :title, :content, presence: true
    mount_uploader :image, ImageUploader
    enum post_status: [ :draft, :post_later, :posted ]
    belongs_to :user
    after_save :enqueue_post_later_job, if: :post_later?
    has_many :comments, dependent: :destroy

  private
  def enqueue_post_later_job
    PostLaterJob.set(wait_until: self.posted_date).perform_later(self.id)
  end

end
