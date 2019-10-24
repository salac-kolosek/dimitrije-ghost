class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  acts_as_paranoid
  mount_uploader :avatar, AvatarUploader
  has_many :my_stories, foreign_key: "owner_id", class_name: "Story", dependent: :destroy

  validates :email, uniqueness: true
  validates :full_name, presence: true

  before_create :create_slug

  ADMIN = 0
  AUTHOR = 1
  EDITOR = 2

  def admin?
    self.role == ADMIN
  end

  def author?
    self.role == AUTHOR
  end

  def editor?
    self.role == EDITOR
  end

  private

  def create_slug
    # make this prettier
    self.slug = full_name
  end
end
