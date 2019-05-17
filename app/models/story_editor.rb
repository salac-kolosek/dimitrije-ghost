class StoryEditor < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :user, :story, presence: true
end
