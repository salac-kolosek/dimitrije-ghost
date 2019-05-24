require 'rails_helper'
 
RSpec.feature "User updates profile" do
  given!(:user) { create(:user) }

  scenario 'with valid parametars' do
    logs_in_user(user)
    visit edit_user_path(user)
    fill_in 'user[full_name]', with: "John Doe"
    fill_in 'Email', with: "john@gmail.com"
    fill_in 'Bio', with: "Stuff about me"
    fill_in 'Slug', with: 'john-d'
    click_button 'Save'
    expect(page).to have_content "Profile updated!" 
  end

  scenario 'with invalid email format' do
    logs_in_user(user)
    visit edit_user_path(user)
    fill_in 'user[full_name]', with: "John Doe"
    fill_in 'Email', with: "john"
    fill_in 'Bio', with: "Stuff about me"
    fill_in 'Slug', with: 'john-d'
    click_button 'Save'
    expect(page).to have_content "There was an problem!"
  end

  scenario 'without full name' do
    logs_in_user(user)
    visit edit_user_path(user)
    fill_in 'user[full_name]', with: ""
    fill_in 'Email', with: "john"
    fill_in 'Bio', with: "Stuff about me"
    fill_in 'Slug', with: 'john-d'
    click_button 'Save'
    expect(page).to have_content "There was an problem!"
  end

end