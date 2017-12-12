class User < ApplicationRecord
  has_one :user_icon, dependent: :destroy
  has_many :other_comments, dependent: :destroy
  has_many :pictures, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true,
            length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
