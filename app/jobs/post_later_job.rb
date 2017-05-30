class PostLaterJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    post.update(post_status: "posted")
  end
end
