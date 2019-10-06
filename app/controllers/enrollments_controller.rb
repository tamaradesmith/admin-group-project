class EnrollmentsController < ApplicationController
  before_action :find_enrollment, only: [:update, :destroy]
  before_action :find_course

  def index
    @assignments = Assignment.select('assignments.name, assignments.id, course_assignments.due_date , course_assignments.user_id, courses.id as course_id, course_assignments.id as relation_ship_id ').joins("LEFT JOIN course_assignments ON course_assignments.assignment_id = assignments.id LEFT JOIN courses ON course_assignments.course_id = courses.id AND courses.id = #{@course.id}").paginate(page:params[:page],per_page:10)
    @markers = User.all().where("role_id = 2")

    @
    @students = User.order(first_name: :asc).where('role_id = 1')
  end

  def create
    @course = Course.find params[:course_id]
    @enrollment = Enrollment.new enrollment_params
    # @enrollment.course = @course
    if @enrollment.save
      redirect_to course_path(@course),
      notice: 'Successfully added the student!'
    else 
      render 'courses/show'
    end
  end

  def destroy
    
  end

  private
    
  def enrollment_params
      params.permit(:course_id, :user_id )
  end
  
  def find_enrollment
      @enrollment = Enrollment.find(params[:id])
  end

  def find_course
      @course = Course.find(params[:course_id])
  end
end
