class Tag < ApplicationRecord
  has_many :taggings
  has_many :stories, through: :taggings

  validates :name, presence: true
end
