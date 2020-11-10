class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
