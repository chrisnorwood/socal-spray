class Rating < ApplicationRecord
  validates :stars, presence: true

  belongs_to :rateable, polymorphic: true
  belongs_to :user
end
