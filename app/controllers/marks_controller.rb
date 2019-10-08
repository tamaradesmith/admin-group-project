class MarksController < ApplicationController
    before_action :find_mark, only: [ :update, :destroy]
    before_action :find_user, except: [:destroy]
    before_action :find_course, except: [:destroy]
    def index
        @course = Course.find(params[:course_id])
        @user = User.find(params[:user_id])
        @marks = CourseAssignment.select('assignments.name as assignment_name, assignments.id as assignment_id, course_assignments.due_date , course_assignments.user_id as marker_id, courses.id as course_id, course_assignments.id as relation_ship_id, marks.id, marks.user_id as student_id, marks.grade ').joins("INNER JOIN assignments ON course_assignments.assignment_id = assignments.id INNER JOIN courses ON course_assignments.course_id = courses.id AND courses.id = #{@course.id} LEFT JOIN marks ON marks.course_assignment_id = course_assignments.id AND marks.user_id = #{params[:user_id]}").paginate(page:params[:page],per_page:5)
        # byebug
        @marks_array = @marks.collect(&:grade).to_json.html_safe
        # @marks_array = []
        # @marks.each do |mark|
        #     @marks_array.push(mark.grade)
        # end
        @assignments_array = @marks.collect(&:assignment_name).to_json.html_safe
        # @assignments_array = []
        # @marks.each do |mark|
        #     @assignments_array.push(mark.assignment_name)
        # end
        # byebug
    end

    def create
        mark = Mark.new mark_params
        if mark.save
            flash[:notice] = "Mark created successfully"
        end
        redirect_to marks_path(@course, @user)
    end

    def update
        if @mark.update mark_params
            flash[:notice] = "Mark updated successfully"
        end
        redirect_to marks_path(@course, @user)
    end
    
    def destroy
        course_assignment = CourseAssignment.find(@mark.course_assignment_id)
        @course = Course.find(course_assignment.course_id)
        @user = User.find(course_assignment.user_id)
        @mark.destroy
        redirect_to marks_path(@course, @user)
    end
    

    def show_assignments
        @course = Course.find(params[:course_id])
        @user = User.find(params[:user_id])
        @marks = CourseAssignment.select('assignments.name as assignment_name, assignments.id as assignment_id, course_assignments.due_date , course_assignments.user_id as marker_id, courses.id as course_id, course_assignments.id as relation_ship_id, marks.id, marks.user_id as student_id, marks.grade ').joins("INNER JOIN assignments ON course_assignments.assignment_id = assignments.id INNER JOIN courses ON course_assignments.course_id = courses.id AND courses.id = #{@course.id} LEFT JOIN marks ON marks.course_assignment_id = course_assignments.id AND marks.user_id = #{params[:user_id]}").paginate(page:params[:page],per_page:5)
    end
    
    private
    
    def mark_params
        params.permit(:grade, :course_assignment_id, :user_id )
    end

    def find_mark
        @mark = Mark.find(params[:id])
    end

    def find_course
        @course = Course.find(params[:course_id])
    end

    def find_user
        @user = User.find(params[:user_id])
    end
end
