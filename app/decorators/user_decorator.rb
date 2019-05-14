class UserDecorator < Draper::Decorator
  decorates :user
  delegate_all


  def show_avatar
    if object.avatar.present?
      h.image_tag user.avatar_url, size: 42
    else
      h.image_tag 'https://pngimage.net/wp-content/uploads/2018/06/no-avatar-png.png', size: 42
    end
  end

  def role
    if object.admin?
      "Admin"
    else
      "Author"
    end
  end
end
