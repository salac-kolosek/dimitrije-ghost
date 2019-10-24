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
    run User::Update, user_params do |result|
      flash[:notice] = "User is successfuly updated"
      authorize result["model"]
      redirect_to edit_user_path(result["model"])
    end
    flash[:alert] = "There was an problem!"
  end

  def destroy
    run User::Delete
    redirect_to team_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :slug, :email, :bio, :avatar, :role)
  end
end
