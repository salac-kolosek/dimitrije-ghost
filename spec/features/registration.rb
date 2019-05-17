require 'rails_helper'

RSpec.feature "User creates account" do

  scenario 'with valid email format' do
    visit new_user_registration_path
    fill_in 'Email', with: "new@example.com"
    fill_in 'Full name', with: "New User"
    fill_in 'Bio', with: "Testing testing 123 123"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'with invalid email format' do
    visit new_user_registration_path
    fill_in 'Email', with: "new"
    fill_in 'Full name', with: "New User"
    fill_in 'Bio', with: "Testing testing 123 123"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    expect(page).to have_content "Email is invalid"
  end

  scenario 'without full name' do
    visit new_user_registration_path
    fill_in 'Email', with: "new@example.com"
    fill_in 'Bio', with: "Testing testing 123 123"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    expect(page).to have_content "Full name can't be blank"
  end
end