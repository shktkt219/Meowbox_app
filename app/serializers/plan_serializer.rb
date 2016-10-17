class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description
end
