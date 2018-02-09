class Ability
  include CanCan::Ability

  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, :published => true
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  def initialize(user)
    return unless user

    if user.has_role? :admin
      can :manage, :all # allow admin users to do anything
      can :access, :rails_admin # only allow admin users to access Rails Admin
      can :dashboard, :all # allow admin users access to dashboard
    end

    if user.has_role? :entertainer
      can :manage, [Request, User]
    end

    if user.has_role? :requester
      can :create, [Request]
      can :read, [Request]
      can :manage, [User] # TODO: make sure they can only delete themself
    end
  end
end
