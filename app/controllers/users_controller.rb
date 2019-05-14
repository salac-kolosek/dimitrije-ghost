class UsersController < ApplicationController
  # This will be deleted, for now this is root
  def index
    @users = User.with_full_name
  end

  def edit
    @user = User.find(params[:id]).decorate
    authorize @user
  end

  def update
    @user = User.find(params[:id])
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
end
