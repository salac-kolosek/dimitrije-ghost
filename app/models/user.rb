class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  mount_uploader :avatar, AvatarUploader
  has_many :my_stories, foreign_key: "owner_id", class_name: "Story"
  has_many :story_editors
  has_many :stories, through: :story_editors

  validates :email, uniqueness: true
  validates :full_name, presence: true

  before_create :create_slug

  def admin?
    admin
  end

  private

  def create_slug
    # make this prettier
    self.slug = full_name.split(" ")[0].downcase + "-" + full_name.split(" ")[1].first.downcase unless full_name == nil
  end
end
