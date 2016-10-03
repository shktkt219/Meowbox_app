class Item < ActiveRecord::Base
  has_many :box_items
  has_many :boxes, through: :box_items

  validates :title, :description, :size, presence: true
  validates_uniqueness_of :title
end
