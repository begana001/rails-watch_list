class MovieReview < ApplicationRecord
  belongs_to :movie

  validates :comment, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, length: { in: 1..10 }
end
