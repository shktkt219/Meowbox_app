class Box < ActiveRecord::Base
  belongs_to :plan
  has_many :box_items
  has_many :items, through: :box_items

  default_scope { order(created_at: :desc) }

end
