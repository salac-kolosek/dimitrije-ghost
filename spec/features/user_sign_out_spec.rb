require 'rails_helper'

RSpec.feature "User sign out" do
  given!(:user) { create(:user) }

  scenario 'successfully' do
    logs_in_user(user)
    visit authenticated_root_path
    click_on 'Sign out'
    expect(page).to have_content "Log in"
  end
end
