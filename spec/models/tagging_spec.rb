require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe "Attributes" do
    it { is_expected.to have_db_column(:tag_id).of_type(:integer) }
    it { is_expected.to have_db_column(:story_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "Associations" do
    it { should belong_to(:tag).class_name("Tag") }
    it { should belong_to(:story).class_name("Story") }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:tag) }
    it { is_expected.to validate_presence_of(:story) }
  end
end
