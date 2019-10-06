# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    # Do for assignments
    # admin has all
    # Instructor has all
    # Student has only theirs

    # Do for courses
    # Admin has all 
    # Instructor has only assigned
    # Student has only assigned

    # Show page
    # Admin can see all
    # Instructor can see all of courses they are apart of
    # Student can only see theirs

    # :create, :read, :update, :destroy, :to => :crud
    # can :read, Project, :active => true, :user_id => user.id
    
    user ||= User.new # guest user (not logged in)
      if user.role_id == 3
        can :manage, :all
      elsif user.role_id == 2
        # This should work, but please review if I'm missing anything!
        can :manage, :course_assignments
        can :manage, :marks, :user_id => user.id
        can :manage, :attendances, :user_id => user.id
      elsif user.role_id == 1
        can :read, Course, :user_id => user.id
        can :read, Mark, :user_id => user.id
        can :read, Attendance, :user_id => user.id
      end
      
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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
