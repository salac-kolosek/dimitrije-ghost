class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update ]

  def edit
  end

  def update
    @user.update(user_params)
    flash[:success] = "Profile updated!"

    redirect_to edit_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :slug, :email, :bio, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
