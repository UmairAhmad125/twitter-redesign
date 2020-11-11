require 'rails_helper'

DatabaseCleaner.start
RSpec.describe 'sign in page', type: :feature do
  let!(:user) do
    User.create(user_name: 'umair.ahmad', email: 'umair@gmail.com', password: '123456', full_name: 'umair ahmad')
  end

  let!(:user2) do
    User.create(user_name: 'talha.waqar', email: 'talha@gmail.com', password: '123456', full_name: 'talha waqar')
  end
  describe 'the follow process', type: :feature do
    it 'signs me in' do
      visit new_user_session_path
      within('#login-form') do
        fill_in 'user[email]', with: 'umair@gmail.com'
        fill_in 'user[password]', with: '123456'
        click_button 'commit'
      end
      expect(page).to have_content('talha.waqar')
      within('#follow') do
        click_on 'Follow +'
      end
      expect(page).to have_content('talha.waqar')
    end
  end

  DatabaseCleaner.clean
end
