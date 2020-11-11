class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :desc, -> { order(created_at: :desc) }
  has_one_attached :Photo
  has_one_attached :CoverImage
  has_many :opinions, foreign_key: :author_id

  has_many :followers_connection, foreign_key: :followed_id, class_name: 'Following', dependent: :destroy
  has_many :followers, through: :followers_connection, source: :follower
  has_many :followed_connection, foreign_key: :follower_id, class_name: 'Following', dependent: :destroy
  has_many :followed, through: :followed_connection, source: :followed

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze }
  validates :full_name, presence: true
end
