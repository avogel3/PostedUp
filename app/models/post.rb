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
  paginates_per 10
  include Rails.application.routes.url_helpers
  validates :title, :content, presence: true
  mount_uploader :image, ImageUploader
  enum post_status: [ :draft, :post_later, :posted ]
  belongs_to :user
  after_save :enqueue_post_later_job, if: :post_later?
  has_many :comments, dependent: :destroy
  after_save :enqueue_post_to_social_job, if: :allow_social_post?

  def image_url
    self.image.url
  end

  private
  def enqueue_post_later_job
    PostLaterJob.set(wait_until: self.posted_date).perform_later(self.id)
  end

  def allow_social_post?
    return Rails.application.secrets.allow_social_post
  end

  def enqueue_post_to_social_job
    link_url = post_url(self, host: Rails.application.secrets.host_url)
    PostToSocialJob.perform_later(link_url)
  end
end
