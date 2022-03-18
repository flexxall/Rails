class ProfilesController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end