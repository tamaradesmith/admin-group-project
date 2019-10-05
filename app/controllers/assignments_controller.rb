class AssignmentsController < ApplicationController
    before_action :find_assignment, only: [:show, :edit, :update, :destroy]
    def new
        @assignment = Assignment.new
        render :new
      end
      def create
        @assignment = Assignment.new assignment_params
        if @assignment.save
          flash[:notice] = "Assignment created successfully"
          redirect_to assignment_path(@assignment)
        else
          render :new
        end
      end
    
      def show
      end
    
      def index
          @assignments = Assignment.all
      end
      def edit
        
      end
      
      def update
        if @assignment.update assignment_params
          redirect_to assignment_path(@assignment)
        else
          render :edit
        end
      end
    
      def destroy
        flash[:notice] = "Assignment destroyed!"
        @assignment.destroy
        redirect_to assignments_path
      end
    
      private
    
      def assignment_params
        params.require(:assignment).permit(:name, :description )
      end
    
      def find_assignment
        @assignment = Assignment.find(params[:id])
      end
end
