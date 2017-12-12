class OtherComment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates :other_comment, presence: true
end
