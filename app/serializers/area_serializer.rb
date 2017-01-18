class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :slug
  belongs_to :user
  belongs_to :parent
  has_many :children

  def parent
    unless object.parent.nil?
      return {
        type: "areas",
        id:   object.parent.id,
        name: object.parent.name,
        slug: object.parent.slug
      }
    end
  end

end