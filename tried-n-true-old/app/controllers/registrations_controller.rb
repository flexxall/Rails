class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path,
                    notice: "A new user account was successfully created"
      else
        # flash[:alert] = "An error has occurred!"
        render :new
      end
    end
  
    private
  
    def user_params
      params
        .require(:user)
        .permit(:username, :email, :password, :password_confirmation)
    end
  end