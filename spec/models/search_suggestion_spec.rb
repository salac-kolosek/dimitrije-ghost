require 'rails_helper'

RSpec.describe SearchSuggestion, type: :model do
  describe "Attributes" do
    it { is_expected.to have_db_column(:term).of_type(:string) }
    it { is_expected.to have_db_column(:popularity).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end
end
