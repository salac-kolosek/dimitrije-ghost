class BlogController < ApplicationController
  layout 'blog'

  def index
    @stories = Kaminari.paginate_array(Story.all).page(params[:page]).per(7)
    @site_title = SiteTitle.last
  end

  def show
    @story = Story.friendly.find(params[:id])
  end
end
