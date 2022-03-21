class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :movie_reviews, dependent: :destroy


  validates :title, presence: true
  validates :overview, presence: true
  validates :rating, presence: true
  validates :poster_url, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title, 
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
