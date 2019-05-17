require 'rails_helper'
 
RSpec.feature "User log in" do
  given!(:user) { create(:user) }
 
  scenario 'with valid credentials' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."
  end

  scenario 'with invalid credentials' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "invalid password"
    click_button 'Log in'
    expect(page).to have_content "Invalid Email or password."
  end
end