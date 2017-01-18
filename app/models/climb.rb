class Climb < ApplicationRecord  
  validates :name, presence: true
  validates :grade, presence: true
  validates :fa, presence: true
  # validates :location, presence: true
  validates :description, presence: true

  belongs_to :user

  belongs_to :area

  has_many :ratings, as: :rateable
  has_many :comments, as: :commentable

end