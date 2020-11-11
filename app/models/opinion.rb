class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  scope :desc, -> { order(created_at: :desc) }

  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }
end
