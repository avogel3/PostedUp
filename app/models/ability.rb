class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :my_posts, to: :access

    if user
      can :read, Post, user_id: user.id
      can :read, Post, post_status: "posted"
      can :create, Post
      can :access, Post, user_id: user.id
    else
      can :read, Post, post_status: "posted"
    end
  end
end
