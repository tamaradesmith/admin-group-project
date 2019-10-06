class UsersController < ApplicationController
  
  before_action :find_user, only: [:show]

  def new
      @user = User.new
  end

  def create
    #this method should allow for authorization and remove it from the view
    #I'm not entirely sure on the implementation yet, but from cancancan it should hide create a user if not ADMIN
    #authorize! :manage, User
      @user = User.new user_params
      if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
      else
          render :new
      end
  end

  def show
   
  end
#This will allow for users to be imported and then afterwards redirects
  def import
    User.import(params[:file])
    #After import, redirect and say if it worked or not.
    redirect_to(root_path, notice: "Imported User file.")
  end

  def index
    @users = User.all
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
