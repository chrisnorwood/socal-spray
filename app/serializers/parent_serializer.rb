class ParentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :slug
end