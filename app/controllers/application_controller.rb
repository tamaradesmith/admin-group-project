class ApplicationController < ActionController::Base
    # def current_user
    #     if session[:user_id].present?
    #         @current_user ||= User.find_by(id: session[:user_id])
    #     end
    # end

    def current_user
        User.find_by(id: session[:user_id])
    end


    helper_method(:current_user)

    def user_signed_in?
        current_user.present?
    end
    helper_method(:user_signed_in?)

    def authenticate_user!
        unless :user_signed_in?
            flash[:danger] = "Please sign in to user the application."
            redirect_to new_session_path
        end
    end
end
