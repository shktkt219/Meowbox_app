class Box < ActiveRecord::Base
  has_many :user_boxes
  has_many :users, through: :user_boxes

  has_many :box_items
  has_many :items, through: :box_items

  accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes['title'].blank? }

end
