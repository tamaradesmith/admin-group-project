class MarksController < ApplicationController
    
    def index
        
    end

    def create
        
    end

    def show_assignments
        @course = Course.find(params[:course_id])
        @user = User.find(params[:user_id])
        @assignments = CourseAssignments.select('assignments.name, assignments.id as assignment_id, course_assignments.due_date , course_assignments.user_id as marker_id, courses.id as course_id, course_assignments.id').joins("INNER JOIN assignments ON course_assignments.assignment_id = assignments.id INNER JOIN courses ON course_assignments.course_id = courses.id AND courses.id = #{@course.id}").paginate(page:params[:page],per_page:10)
    end
    
end
