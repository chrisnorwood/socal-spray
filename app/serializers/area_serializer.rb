class AreaSerializer < ActiveModel::Serializer
  attributes :name, :description, :location
  belongs_to :parent
  has_many :children
end