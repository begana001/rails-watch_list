class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks
  has_many :lists
  has_many :list_comments
  has_many :list_likes
  has_many :movie_likes
  has_many :movie_reviews

  validates :username, presence: true
end
