class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :Photo
  has_one_attached :CoverImage
  has_many :opinions, foreign_key: :author_id

  has_many :followers_connection, foreign_key: :followed_id, class_name: 'Following', dependent: :destroy
  has_many :followers, through: :followers_connection, source: :follower
  has_many :followed_connection, foreign_key: :follower_id, class_name: 'Following', dependent: :destroy
  has_many :followed, through: :followed_connection, source: :followed
end
