class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :movie_reviews, dependent: :destroy
  has_many :movie_likes

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

  def liked?(user)
    !!self.movie_likes.find{|like| like.user_id == user.id }
  end
end
