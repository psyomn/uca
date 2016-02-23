class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:moderator)
      can :manage, Newsitem
      can :manage, Band
      can :manage, Song
      can :manage, User
      can :manage, Rating
      can :manage, Submission
      can :manage, SubmissionComment
      can :read, :all
    elsif id = user.id
      # User exists
      can :manage, Song, user_id: id
      can :manage, Band, user_id: id
      can :manage, User, id: id
      can :manage, Rating, user_id: id
      can :manage, Submission, user_id: id
      can :manage, SubmissionComment, user_id: id
      can :read, :all
    else
      # guests
      # Should be able to view names of bands, songs
      # Maybe disallow downloads of songs
      can :read, :all
    end

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
  end
end
