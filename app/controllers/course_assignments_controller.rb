class CourseAssignmentsController < ApplicationController
    before_action :find_course_assignment, only: [ :update, :destroy]
    before_action :find_course, except: [:destroy]
    def index
        @assignments = Assignment.select('assignments.name, assignments.id, course_assignments.due_date , course_assignments.user_id, courses.id as course_id, course_assignments.id as relation_ship_id ').joins("LEFT JOIN course_assignments ON course_assignments.assignment_id = assignments.id LEFT JOIN courses ON course_assignments.course_id = courses.id AND courses.id = #{@course.id}").paginate(page:params[:page],per_page:10)
        @markers = User.all().where("role_id = 2")
    end
    
    def create
        course_assignment = CourseAssignment.new course_assignment_params
        course_assignment.course = @course
        if course_assignment.save
            flash[:notice] = "CourseAssignment created successfully"
        end
        redirect_to course_assignments_path(@course)
    end    
    
    def update
        if @course_assignment.update course_assignment_params
            flash[:notice] = "CourseAssignment updated successfully"
        end
        redirect_to course_assignments_path(@course)
    end
    
    def destroy
        @course = Course.find(@course_assignment.course_id)
        @course_assignment.destroy
        redirect_to course_assignments_path(@course)
    end
    
    private
    
    def course_assignment_params
        params.permit(:due_date, :assignment_id, :user_id )
    end
    
    def find_course_assignment
        @course_assignment = CourseAssignment.find(params[:id])
    end

    def find_course
        @course = Course.find(params[:course_id])
    end
end
