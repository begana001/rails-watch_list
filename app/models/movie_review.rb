class MovieReview < ApplicationRecord
  belongs_to :movie

  validates :comment, precense: true, length: { minimum: 6 }
  validates :rating, precense: true, length: { in: 1..10 }
end
