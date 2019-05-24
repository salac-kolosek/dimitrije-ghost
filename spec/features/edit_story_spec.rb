require 'rails_helper'
 
RSpec.feature "User edits existing story" do
  given!(:user) { create(:user) }
  given!(:story) { create(:story, owner: user) }


  scenario 'with valid parametars' do
    logs_in_user(user)
    visit edit_story_path(story)
    fill_in 'Title', with: "Hello, world!"
    fill_in 'Tags', with: "world"
    fill_in 'Content', with: "Some text, its not important just type anything."
    click_button 'Update Story'
    expect(page).to have_content "Story updated!"
  end

  scenario 'with title' do
    logs_in_user(user)
    visit edit_story_path(story)
    fill_in 'Title', with: ""
    fill_in 'Tags', with: "world"
    fill_in 'Content', with: "Some text, its not important just type anything."
    click_button 'Update Story'
    expect(page).to have_content "There was problem!"
  end

  scenario 'visits view mode' do
    logs_in_user(user)
    visit edit_story_path(story)
    click_on 'View mode'
    expect(page).to have_content(story.title)
    expect(page).to have_content(story.content)
  end
end