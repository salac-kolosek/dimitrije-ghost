class GeneralSettingsController < ApplicationController
  def index
    @site_title = SiteTitle.new
  end
end
