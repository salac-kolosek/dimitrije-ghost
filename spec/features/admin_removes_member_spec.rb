require 'rails_helper'

RSpec.feature "Admin removes existing member" do
  given!(:admin) { create(:user, role: User::ADMIN) }
  given!(:user) { create(:user, email: "test@example.com") }

  scenario 'successfully' do
    logs_in_user(admin)
    visit edit_user_path(user)
    click_on 'Remove'
    expect(page).to have_content "Member removed!"
  end
end
