class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

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
    # byebug
    if params[:role_id] != 'all'  && params[:role_id]
      @users = User.where(role_id: params[:role_id])
    else
      @users = User.all
      @roles = Role.all
    end

    
  end

  def edit
      # @current_edit_user = User.find_by_id(params[:id])
      @roles= Role.all
  end

  def edit_password
    @user = current_user
  end

  def delete
  end

  def update
    password_is_ok = true
    if user_params[:current_password]
      if user_params[:current_password] != nil
        if user_params[:password] != nil
          if user_params[:current_password] == user_params[:password] || user_params[:password] != user_params[:password_confirmation]
            password_is_ok = false
          end
        end
      end
    end

    if password_is_ok 
      if @user.update user_params
        redirect_to user_path
      else
        render :edit
      end
    else
      render :edit_password
    end
  end

  private

  def user_params
      params.require(:user).permit(:status, :first_name, :last_name, :email, :password, :password_confirmation, :address, :picture_url, :role_id)

  end

  def find_user
    @user = User.find(params[:id])
  end
end
