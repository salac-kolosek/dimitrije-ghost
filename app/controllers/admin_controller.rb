class AdminController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super do
      resource.admin = true
      resource.save
    end
  end

  def update
    super
  end
end
