class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # can [:create, :read], :all
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.admin?
      can :manage, :all
      can :crud, Micropost
      # cannot :destroy, :micropost
    elsif !user.admin?
      binding.pry
      can :create, Micropost
      can :read, Micropost, :user_id => user.id
      cannot :destroy, Micropost
      cannot :read, User
    end
  end
end
