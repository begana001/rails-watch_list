class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :list_comments, dependent: :destroy
  has_many :list_likes, dependent: :destroy

  # cloudinary photo
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true

  def liked?(user)
    !!self.list_likes.find{|like| like.user_id == user.id }
  end
end
