class Exercise < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_and_belongs_to_many :users_save, class_name: 'User'
  #has_many :saves
  #has_many :users, through:  :saves
end
