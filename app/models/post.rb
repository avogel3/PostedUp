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
  include Rails.application.routes.url_helpers
  validates :title, :content, presence: true
  mount_uploader :image, ImageUploader
  enum post_status: [ :draft, :post_later, :posted ]
  belongs_to :user
  after_save :enqueue_post_later_job, if: :post_later?
  has_many :comments, dependent: :destroy
  after_save :post_to_social_media, if: :production_and_posted?

  private
  def enqueue_post_later_job
    PostLaterJob.set(wait_until: self.posted_date).perform_later(self.id)
  end

  def production_and_posted?
    return (Rails.env.production? && self.posted?)
  end

  def post_to_social_media
    link_url = post_url(self, host: ENV['HOST_URL'])
    SocialMedia.post_to_wall(link_url)
  end
end
