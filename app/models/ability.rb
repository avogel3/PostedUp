class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :my_posts, to: :access

    if user
      can :read, Post
      can :create, Post
      can :access, Post, user_id: user.id
      can :create, Comment
    else
      can :read, Post
    end
  end
end
