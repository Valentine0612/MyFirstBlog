class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :username
  has_many :exercises, dependent: :destroy
  has_many :comments

  has_and_belongs_to_many :exercises_save, class_name: 'Exercise'
  #has_many :saves
  #has_many :exercises, through: :save
end
