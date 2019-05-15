class Story < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :story_editors
  has_many :users, through: :story_editors
  has_many :taggings
  has_many :tags, through: :taggings
end
