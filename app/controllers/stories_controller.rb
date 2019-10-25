class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [ :edit, :update, :destroy, :show ]

  def index
    if current_user.admin? || current_user.editor?
      @stories = Story.search(params[:term])
    else
      @stories = current_user.my_stories.search(params[:term])
    end
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    run Story::Create, story_params do |result|
      flash[:success] = "Story created!"
      redirect_to stories_path
    end
      flash[:alert] = "There was problem!"
  end

  def edit
  end

  def update
    run Story::Update, story_params do |result|
      flash[:success] = "Story updated!"
      redirect_to stories_path
    end
      flash[:alert] = "There was problem!"
  end

  def destroy
    if @story.destroy
      flash[:success] = "Story deleted!"
    else
      flash[:alert] = "Something went wrong!"
    end

    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :tag_list)
  end

  def set_story
    @story = Story.friendly.find(params[:id])
  end

  private
  def _run_options(context)
    ctx = context.merge(current_user: current_user)
    ctx.merge(test: "test")
  end

end
