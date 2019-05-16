class Story < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :story_editors
  has_many :users, through: :story_editors
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
