class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :my_posts, to: :access
    alias_action :index, to: :read_feed
    alias_action :show, to: :view_post

    if user
      can :read_feed, Post
      can :view_post, Post do |post|
        (post.posted?) || (post.user_id == user.id)
      end
      can :create, Post
      can :access, Post, user_id: user.id
    else
      can :read_feed, Post
      can :view_post, Post do |post|
        post.posted?
      end
    end
    can :create, Comment
  end
end
