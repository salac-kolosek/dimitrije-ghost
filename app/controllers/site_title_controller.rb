class SiteTitleController < ApplicationController

  def create
    @site_title = SiteTitle.new(site_title_params)
    if @site_title.save
      flash[:success] = "Name of your site changed!"
      redirect_to general_settings_path
    else
      flash[:alert] = "There was problem!"
      redirect_to general_settings_path
    end
  end

  private

  def site_title_params
    params.require(:site_title).permit(:title)
  end
end
