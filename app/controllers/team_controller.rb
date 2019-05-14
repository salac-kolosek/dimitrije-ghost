class TeamController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin?

    @users = User.all.decorate
  end
end
