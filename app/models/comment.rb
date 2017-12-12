class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :pictures
end
