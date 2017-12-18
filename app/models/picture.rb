class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true

  has_many :favorites, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :like_users, through: :likes, source: :user
  has_many :other_comments
  belongs_to :user
end
