class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :exercise
  belongs_to :user
end
