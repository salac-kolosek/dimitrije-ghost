require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true)}

  it "has a valid factory" do
    expect(user).to be_valid
  end

  describe "Attributes" do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:invitation_token).of_type(:string) }
    it { is_expected.to have_db_column(:invitation_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:invitation_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:invitation_accepted_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:invitation_limit).of_type(:integer) }
    it { is_expected.to have_db_column(:invited_by_id).of_type(:integer) }
    it { is_expected.to have_db_column(:invitations_count).of_type(:integer) }
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:admin).of_type(:boolean) }
    it { is_expected.to have_db_column(:full_name).of_type(:string) }
    it { is_expected.to have_db_column(:slug).of_type(:string) }
    it { is_expected.to have_db_column(:avatar).of_type(:string) }
    it { is_expected.to have_db_column(:bio).of_type(:text) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:my_stories).class_name("Story") }
    it { is_expected.to have_many(:stories).class_name("Story").through(:story_editors) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it { is_expected.to_not allow_value("johndoe").for(:email) }
    it { is_expected.to allow_value("johndoe@example.com").for(:email) }
  end

  describe "Creation" do
    it "should always have a slug given a full name" do
      params = { user: { email: "janedoe@email.com", password: "password", full_name: "Jane Doe", bio: "CEO", admin: false } }

      user = User.create(params[:user])
      expect(user.slug).to eql("jane-d")
    end
  end

  describe "Methods" do
    describe "#admin?" do
      context "when user is not admin" do
        it "returns false" do
          expect(user.admin?).to be false
        end
      end
      context "when user is admin" do
        it "returns true" do
          expect(admin.admin?).to be true
        end
      end
    end
  end

end
