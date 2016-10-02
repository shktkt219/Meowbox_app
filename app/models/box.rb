class Box < ActiveRecord::Base
  belongs_to :subscription
  has_many :box_items
  has_many :items, through: :box_items

  accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes['title'].blank? }

end
