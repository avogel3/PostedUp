class Post < ApplicationRecord
  include Rails.application.routes.url_helpers

  paginates_per 10
  mount_uploader :image, ImageUploader

  enum post_status: %i[draft post_later posted]

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true

  after_save :enqueue_post_later_job, if: :post_later?
  after_save :enqueue_post_to_social_job, if: :allow_social_post?

  def author
    user.display_name
  end

  private

  def enqueue_post_later_job
    PostLaterJob.set(wait_until: posted_at).perform_later(id)
  end

  def allow_social_post?
    Rails.application.secrets.allow_social_post
  end

  def enqueue_post_to_social_job
    link_url = post_url(self, host: Rails.application.secrets.host_url)
    PostToSocialJob.perform_later(link_url)
  end
end
