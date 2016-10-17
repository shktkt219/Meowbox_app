class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description
  # has_many :boxes
end
