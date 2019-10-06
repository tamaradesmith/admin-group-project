# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
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

    
    user ||= User.new # guest user (not logged in)
      if user.role_id == 3
        can :manage, :all
      elsif user.role_id == 2
        # This should work, but please review if I'm missing anything!
        can :manage, :course_assignments
        can :manage, :marks
        can :manage, :attendances
      end
    #Not quite sure how to write permissions for students, I believe this is the right way

    can :read, :Mark do |mark|
      mark.user == user
    end
    can :read, :Attendance do |attendance|
      attendance.user == user
    end
  end
end
