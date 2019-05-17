class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :story

  validates :tag, :story, presence: true
end
