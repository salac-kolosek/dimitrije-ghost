require 'rails_helper'
 
RSpec.feature "User creates new story" do
  given!(:user) { create(:user) }

  scenario 'with valid parametars' do
    logs_in_user(user)
    visit new_story_path
    fill_in 'Title', with: "New Title"
    fill_in 'Tags', with: "javascript, jquery, d3.js"
    fill_in 'Content', with: "Lorem ipsum dolor sit amet."
    click_button 'Create Story'
    expect(page).to have_content("Story created!")
  end

  scenario 'without title' do
    logs_in_user(user)
    visit new_story_path
    fill_in 'Title', with: ""
    fill_in 'Tags', with: "javascript, jquery, d3.js"
    fill_in 'Content', with: "Lorem ipsum dolor sit amet."
    click_button 'Create Story'
    expect(page).to have_content("There was problem!")
  end
end