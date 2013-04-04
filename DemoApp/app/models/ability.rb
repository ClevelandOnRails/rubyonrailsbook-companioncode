class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user, not logged in.
    
    if user.role? == :admin
      can :manage, :all
    else
      can :read, :all
      end
      if user.role == "default"
        can :create, Article
        end
        can :destroy, Article, :user_id => user.id
          #article.try(:user) == user
          #can :read, Project, :active => true, :user_id => user.id
        can :edit, Article, :user_id => user.id
  end
end
