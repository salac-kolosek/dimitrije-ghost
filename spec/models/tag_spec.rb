require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { create(:tag) }

  it "has a valid factory" do
    expect(tag).to be_valid
  end

  describe "Attributes" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:taggings).class_name("Tagging") }
    it { is_expected.to have_many(:stories).class_name("Story").through(:taggings) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
