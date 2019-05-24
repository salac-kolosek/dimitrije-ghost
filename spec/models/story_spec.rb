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
    it { is_expected.to have_many(:taggings).class_name("Tagging") }
    it { is_expected.to have_many(:tags).class_name("Tag").through(:taggings) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "Scopes" do
    describe ".search" do
      it "should return all stories when passed nil" do
        story1 = create(:story)
        user2 = create(:user, email: "user2@example.com")
        story2 = create(:story, title: "Story 2", owner: user2)
        expect(Story.search(nil).count).to eq [story1, story2].count
      end

      it "should return story with title 'something' when passed 'someth'" do
        something = create(:story, title: "something")
        expect(Story.search("someth").count).to eq [something].count
      end
    end
  end
end
