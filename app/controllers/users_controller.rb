class UsersController < ApplicationController
  # This will be deleted, for now this is root
  def index
    @users = User.all.decorate
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

  def destroy
    @user = User.find(params[:id])
    DeleteMemberWorker.perform_async(@user)
    flash[:success] = "Member removed!"
    redirect_to team_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :slug, :email, :bio, :avatar, :role)
  end
end
