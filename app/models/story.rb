class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :owner, class_name: "User"
  has_many :taggings
  has_many :comments
  has_many :tags, through: :taggings, dependent: :destroy

  validates :owner, :title, presence: true

  scope :search, -> (term) { where('title LIKE ? ', "%#{term}%") }

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
