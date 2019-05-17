class Story < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :story_editors
  has_many :users, through: :story_editors
  has_many :taggings
  has_many :tags, through: :taggings

  validates :owner, :title, presence: true

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
