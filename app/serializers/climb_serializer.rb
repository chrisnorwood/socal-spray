class ClimbSerializer < ActiveModel::Serializer
  attributes :id, :name, :grade, :fa, :description, :location, :slug
  belongs_to :user
  belongs_to :area
end