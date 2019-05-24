require 'rails_helper'

RSpec.feature "Admin deletes existing story" do
  given!(:admin) { create(:user, role: User::ADMIN, email: "notjohndoe@example.com") }
  given!(:story) { create(:story) }


  scenario 'successfully' do
    logs_in_user(admin)
    visit edit_story_path(story)
    click_on 'Delete story'
    expect(page).to have_content "Story deleted!"
  end
end
