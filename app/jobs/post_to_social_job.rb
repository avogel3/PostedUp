class PostToSocialJob < ApplicationJob
  queue_as :default

  def perform(link_url)
    SocialMedia.post_to_wall(link_url)
  end
end
