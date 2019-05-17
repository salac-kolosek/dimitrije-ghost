require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:story) { create(:story) }

  it "has a valid factory" do
    expect(story).to be_valid
  end

  describe "Attributes" do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:owner_id).of_type(:integer) }
  end

  describe "Associations" do
    it { should belong_to(:owner).class_name("User") }
    it { is_expected.to have_many(:story_editors).class_name("StoryEditor") }
    it { is_expected.to have_many(:users).class_name("User").through(:story_editors) }
    it { is_expected.to have_many(:taggings).class_name("Tagging") }
    it { is_expected.to have_many(:tags).class_name("Tag").through(:taggings) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "Methods" do 
    describe ".search" do
      it "should return all stories when passed nil" do
        expect(Story.search(nil)).to eq []
      end

      xit "should return story with 'title' when passed 'title'" do
        something = build(:story, title: "Rails 5")
        expect(Story.search("Rails 5")).to eq something
      end
    end
  end
end
