class BoxSerializer < ActiveModel::Serializer
  attributes :id, :title, :month_year
  has_may :items, serializer: BoxItemSerializer
end
