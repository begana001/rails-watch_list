class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :movie_reviews

  validates :title, presence: true
  validates :overview, presence: true
  validates :like, presence: true
  validates :rating, presence: true
  validates :poster_url, presence: true
end
