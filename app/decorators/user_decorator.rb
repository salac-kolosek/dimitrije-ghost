class UserDecorator < Draper::Decorator
  decorates :user
  delegate_all


  def show_avatar
    if object.avatar.present?
      h.image_tag user.avatar_url, size: 42, class: "rounded"
    else
      h.image_tag 'https://pngimage.net/wp-content/uploads/2018/06/no-avatar-png.png', size: 42, class: "rounded"
    end
  end

  def role_in_words
    case object.role
    when User::ADMIN
      "Admin"
    when User::AUTHOR
      "Author"
    when User::EDITOR
      "Editor"
    end
  end
end
