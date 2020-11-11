require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let!(:opinion) do
    Opinion.create(text: 'test opinion')
  end
  let!(:opinion2) { Opinion.create }

  DatabaseCleaner.start

  describe Opinion do
    context 'validates text' do
      it { should validate_presence_of(:text) }
    end

    context 'associations' do
      it { should belong_to(:user) }
    end
  end
  DatabaseCleaner.clean
end
