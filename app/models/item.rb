class Item < ActiveRecord::Base
  has_many :box_items
  has_many :boxes, through: :box_items

  validates :size, :description, presence: true
  validates_uniqueness_of :item_name

end
