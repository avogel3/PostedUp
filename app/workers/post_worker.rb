class PostWorker
  include Sidekiq::Worker

  def perform(post_id) # Use primitive type for redis queue
    post = Post.find(post_id)
    post.update(post_status: "posted")
  end
end
