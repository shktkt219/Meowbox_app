class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :description, :size, :image, :url
end
