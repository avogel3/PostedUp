class PostToSocialJob < ApplicationJob
  queue_as :default

  def perform(link)
    SocialMedia.call(link)
  end
end
