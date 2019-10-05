class CourseAssignmentsController < ApplicationController
    before_action :find_course_assignment, only: [ :update, :destroy]
    before_action :find_course
    def index
        @assignments = Assignment.select('assignments.name, assignments.id, courses.id as course_id').joins("LEFT JOIN course_assignments ON course_assignments.assignment_id = assignments.id LEFT JOIN courses ON course_assignments.course_id = #{@course.id}  ").paginate(page:params[:page],per_page:5)


    end
    
    def create
        @course = Course.find(params[:course_id])
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
        @course_assignment.destroy
        redirect_to course_assignments_path(@course)
    end
    
    private
    
    def course_assignment_params
        params.require(:course_assignment).permit(:due_date, :assignment_id, :user_id )
    end
    
    def find_course_assignment
        @course_assignment = CourseAssignment.find(params[:id])
    end

    def find_course
        @course = Course.find(params[:course_id])
    end
end
