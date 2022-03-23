class MovieReview < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :comment, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, length: { in: 1..10 }
end
