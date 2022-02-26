class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :list_comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
