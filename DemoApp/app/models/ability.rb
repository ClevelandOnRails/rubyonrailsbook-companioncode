class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user, not logged in.
    
    if user.role? == :admin #users can be admins.
      can :manage, :all #admins can do all.
    else
      can :read, :all #ghosts can only read.
      end
      if user.role == "default" #which is everyone who isn't a ghost or admin.
        can :create, Article #can write stuff.
        end
        can :destroy, Article, :user_id => user.id #can destroy stuff if they own it.
        can :edit, Article, :user_id => user.id #can edit things if they own it.
  end
end