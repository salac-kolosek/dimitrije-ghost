class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader

  before_create :create_slug

  def admin?
    admin
  end

  def avatar?
    !avatar.nil?
  end

  private

  def create_slug
    # make this prettier
    self.slug = full_name.split(" ")[0].downcase + "-" + full_name.split(" ")[1].first.downcase
  end
end
