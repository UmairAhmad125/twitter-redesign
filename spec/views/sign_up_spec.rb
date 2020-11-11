require 'rails_helper'

DatabaseCleaner.start
RSpec.describe 'sign up page', type: :system do
  describe 'sign up page' do
    it 'shows the right content' do
      visit new_user_registration_path
      expect(page).to have_content('Email')
    end
  end
end

describe 'the signup process', type: :feature do
  it 'sign up a new user' do
    visit new_user_registration_path
    within('#signup-form') do
      fill_in 'user[user_name]', with: 'umair.ahmad'
      fill_in 'user[full_name]', with: 'umair ahmad'
      fill_in 'user[email]', with: 'umair@gmail.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_button 'commit'
    end
    expect(page).to have_content('Who to follow')
  end
  DatabaseCleaner.clean
end
