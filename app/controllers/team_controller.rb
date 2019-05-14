class TeamController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin?

    @users = Kaminari.paginate_array(User.all.decorate).page(params[:page]).per(20)
  end
end
