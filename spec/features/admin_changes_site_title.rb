require 'rails_helper'

RSpec.feature "Admin changes site title" do
  given!(:admin) { create(:user, admin: true) }

  scenario 'successfully' do
    logs_in_user(admin)
    visit general_settings_path
    click_on 'Expand'
    fill_in 'site_title[title]', with: "New website title"
    click_on 'Save settings'
    expect(page).to have_content "Name of your site changed!"
  end
end
