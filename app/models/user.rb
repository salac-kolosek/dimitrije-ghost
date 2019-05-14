class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  mount_uploader :avatar, AvatarUploader
  scope :with_full_name, -> { where.not(full_name: nil) }

  #before_create :create_slug

  def admin?
    admin
  end

  private

  # def create_slug
  #   # make this prettier
  #   self.slug = full_name.split(" ")[0].downcase + "-" + full_name.split(" ")[1].first.downcase
  # end
end
