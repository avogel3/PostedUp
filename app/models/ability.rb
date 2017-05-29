class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :my_posts, to: :access

    if user
      can :read, Post
      can :create, Post

      can :access, Post do |post|
        post.user == user
      end
    else
      can :read, Post
    end
  end
end
