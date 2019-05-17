class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [ :edit, :update, :destroy, :show ]

  def index
    if current_user.admin?
      @stories = Story.search(params[:term])
    else
      # and stories where they have access
      @stories = current_user.my_stories.where('title LIKE ?', "%#{params[:term]}%")
    end
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.owner = current_user
    if @story.save
      flash[:success] = "Story created!"
      redirect_to stories_path
    else
      flash[:alert] = "There was problem!"
      redirect_to new_story_path
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      flash[:success] = "Story updated!"
    else
      flash[:alert] = "There was problem!"
    end
    
    redirect_to edit_story_path(@story)
  end

  def destroy
    @story.destroy

    flash[:success] = "Story deleted!"
    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :tag_list)
  end

  def set_story
    @story = Story.find(params[:id])
  end

end
