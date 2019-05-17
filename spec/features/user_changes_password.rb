require 'rails_helper'
 
RSpec.feature "User changes password" do
  given!(:user) { create(:user) }

  scenario 'with valid parametars' do
    logs_in_user(user)
    visit edit_user_registration_path
    fill_in 'New Password', with: "newpassword"
    fill_in 'Verify Password', with: "newpassword"
    fill_in 'Old Password', with: user.password
    click_button 'Update'
    expect(page).to have_content "Your account has been updated successfully." 
  end

  scenario 'with wrong confirmation password' do
    logs_in_user(user)
    visit edit_user_registration_path
    fill_in 'New Password', with: "newpassword"
    fill_in 'Verify Password', with: "wrong"
    fill_in 'Old Password', with: user.password
    click_button 'Update'
    expect(page).to have_content "Password confirmation doesn't match Password" 
  end

  scenario 'with wrong old password' do
    logs_in_user(user)
    visit edit_user_registration_path
    fill_in 'New Password', with: "newpassword"
    fill_in 'Verify Password', with: "newpassword"
    fill_in 'Old Password', with: "wrong"
    click_button 'Update'
    expect(page).to have_content "Current password is invalid" 
  end
end