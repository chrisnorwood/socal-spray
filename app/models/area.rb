class Area < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  # validates :parent_id, presence: true

  belongs_to :parent, class_name: 'Area', optional: true
  has_many :children, class_name: 'Area', foreign_key: 'parent_id'

end
