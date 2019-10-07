class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.order(created_at: :desc)
  end

  def new
    @course = Course.new
    @programs = Program.order(name: :asc)
    @statuses = Status.order(status: :asc)
    render :new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:notice] = "Class created successfully"
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    @enrollment = Enrollment.new
    @program = @course.program.name
    @status = @course.status.status
    @students = User.order(first_name: :asc).where('role_id = 1')
  end

  def edit
    @programs = Program.order(name: :asc)
    @statuses = Status.order(status: :asc)
  end

  def update
    if @course.update course_params
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy 
    flash[:notice] = "Class deleted!"
    @course.destroy
    redirect_to courses_path
  end

  def enroll
    
  end
  
  private

  def course_params
    params.require(:course).permit(:title, :session, :slack_group, :start, :end, :picture_url, :program_id, :status_id)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
