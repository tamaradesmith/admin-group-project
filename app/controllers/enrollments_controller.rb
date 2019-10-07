class EnrollmentsController < ApplicationController
  before_action :find_course

  def index
    @students = User.order(first_name: :asc).where('role_id = 1')
    @enrolled_students = @course.students
  end

  def create
  
    # @enrollment = Enrollment.new user_id: params.requrie(:user_id), course_id: params[:course_id]
    params.require(:user_ids).each do |user_id|
      @enrollment = Enrollment.new user_id: user_id, course_id: params[:course_id]
      if @enrollment.save
      else 
        # @course.errors.add(:user_id ,@enrollment.errors.full_messages[0])
      end
    end
    redirect_to enrollments_path(@course)
    
    # @enrollment.course = find_course
  end

  def destroy
    @enrollment = Enrollment.find_by(user_id: params[:student_id], course_id: @course.id)
    @enrollment.destroy
    redirect_to enrollments_path(@course)
  end

  private

  def find_course
      @course = Course.find(params[:course_id])
  end
end
