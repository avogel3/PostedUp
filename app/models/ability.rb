class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :my_posts, to: :access
    alias_action :index, to: :read_feed
    alias_action :show, to: :view_post
    if user
      can :read_feed, Post
      can :view_post, Post do |post|
        (post.user_id == user.id) || (post.posted?)
      end
      can :create, Post
      can :access, Post, user_id: user.id
    else
      can :read_feed, Post
      can :view_post, Post, post_status: "posted"
    end
    can :create, Comment
  end
end
