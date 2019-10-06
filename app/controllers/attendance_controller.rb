class AttendanceController < ApplicationController

    before_action :find_attendance, only: [:edit, :update]


  def index 

  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def edit

  end

  def update
    if @attendance.update attendance_params
      redirect_to attendance_index_path
    end

  end

  private

  def attendance_params
    params.require(:attendance).permit(:am, :pm, :even, :date)
  end

  def find_attendance
    @attendance = Attendance.find(params[:id])
  end
end
