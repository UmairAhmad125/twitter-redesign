require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create(user_name: 'test', email: 'sds123@gmail.com',
                full_name: 'test user')
  end
  let!(:user2) { User.create }

  DatabaseCleaner.start

  describe User do
    context 'validates username' do
      it { should validate_presence_of(:user_name) }
      it { should validate_uniqueness_of(:user_name) }
    end

    context 'validates full name' do
      it { should validate_presence_of(:full_name) }
    end

    context 'validates email' do
      it { should validate_presence_of(:email) }
      it { should allow_value('abc@gmail.com').for(:email) }
      it { should_not allow_value('abcgmail.com').for(:email) }
    end

    context 'associations' do
      it { should have_many(:followers) }
      it { should have_many(:followed) }
      it { should have_many(:opinions) }
      it { should have_one_attached(:Photo) }
      it { should have_one_attached(:CoverImage) }
    end
  end
  DatabaseCleaner.clean
end
