require 'rails_helper'

DatabaseCleaner.start
RSpec.describe 'sign in page', type: :feature do
  let!(:user) do
    User.create(user_name: 'umair.ahmad', email: 'umair@gmail.com', password: '123456', full_name: 'umair ahmad')
  end
  describe 'index page' do
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Email')
    end
  end

  describe 'the signin process', type: :feature do
    it 'signs me in' do
      visit new_user_session_path
      within('#login-form') do
        fill_in 'user[email]', with: 'umair@gmail.com'
        fill_in 'user[password]', with: '123456'
        click_button 'commit'
      end
      expect(page).to have_content('Who to follow')
      within('#twitch-thoughts') do
        fill_in 'opinion[text]', with: 'My twitch'
        click_on 'commit'
      end
      expect(page).to have_content('My twitch')
    end
  end

  DatabaseCleaner.clean
end
