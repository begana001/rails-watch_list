class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :list_comments, dependent: :destroy

  # cloudinary photo
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
end
