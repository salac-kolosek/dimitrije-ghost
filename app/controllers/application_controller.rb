class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def current_user
    super&.decorate
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email]
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
