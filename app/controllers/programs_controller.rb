class ProgramsController < ApplicationController
  before_action :find_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.order(created_at: :desc)
  end

  def new
    @program = Program.new
    render :new
  end

  def create
    @program = Program.new program_params
    if @program.save
      flash[:notice] = "Program created successfully"
      redirect_to program_path(@program)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @program.update program_params
      redirect_to program_path(@program)
    else
      render :edit
    end
  end

  def destroy 
    flash[:notice] = "Program deleted!"
    @program.destroy
    redirect_to programs_path
  end

  private

  def program_params
    params.require(:program).permit(:name)
  end

  def find_program
    @program = Program.find(params[:id])
  end
end
