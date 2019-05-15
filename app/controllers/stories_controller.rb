class StoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    # admin can see all, authors can only see stories they own, or have access to
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to stories_path
    else
      flash[:alert] = "There was problem!"
      redirect_to new_stories_path
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:title, :content)
  end

end
