class AttendancesController < ApplicationController
    before_action :find_attendance, only: [ :update]
    before_action :find_course

    def create
        attendance = Attendance.new attendance_params
        @user = User.find(params[:user_id])
        attendance.course = @course
        attendance.user = @user
        if attendance.save
            flash[:notice] = "Attendance created successfully"
        end
        # redirect_to course_attendances_path(@course, :date_val =>params[:date_val])
        byebug
        redirect_to "/courses/#{@course.id}/attendances?date_val=#{attendance.date}"
    end
    

    def index 
        @course = Course.find(params[:course_id])
        if params[:date_val]
            @students = Course.select("users.id as user_id, concat_ws(' ',users.first_name,users.last_name) as full_name, attendances.id as attendance_id, attendances.am, attendances.pm, attendances.evening, attendances.date, courses.id as course_id").joins("INNER JOIN enrollments ON enrollments.course_id = courses.id INNER JOIN users ON enrollments.user_id = users.id LEFT JOIN attendances on attendances.user_id = users.id AND attendances.date = '#{params[:date_val]}'").where("courses.id = #{params[:course_id]} AND users.role_id = 2 ")
        else
            @students = []
        end
        # AND attendances.date = '#{params[:course_id]}'
    end
  
    def update
      if @attendance.update attendance_params
        redirect_to course_attendances_path(@course)
      end
  
    end
  
    private
  
    def attendance_params
      params.permit(:am, :pm, :evening, :date)
    end
  
    def find_attendance
      @attendance = Attendance.find(params[:id])
    end

    def find_course
        @course = Course.find(params[:course_id])
    end
end
