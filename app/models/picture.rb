class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true

  has_many :other_comments
  belongs_to :user
end
