require 'rails_helper'
RSpec.feature "Admin deletes existing story" do
  given!(:admin) { create(:user, admin: true) }

  scenario 'with valid email format' do
    logs_in_user(admin)
    visit new_user_invitation_path
    fill_in 'Email', with: "newuser@example.com"
    click_on 'Send an invitation'
    expect(page).to have_content("An invitation email has been sent to newuser@example.com.")
  end

  scenario 'with invalid email format' do
    logs_in_user(admin)
    visit new_user_invitation_path
    fill_in "Email", with: "newuser"
    click_on 'Send an invitation'
    expect(page).to have_content("Email is invalid")
  end
end
