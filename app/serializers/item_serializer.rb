class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :description, :size, :image, :url
  has_may :boxes, serializer: BoxItemSerializer
end
