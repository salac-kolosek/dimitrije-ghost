class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update ]

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      flash[:success] = "Profile updated!"
    else
      flash[:alert] = "There was an problem!"
    end

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
