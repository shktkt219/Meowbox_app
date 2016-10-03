class Box < ActiveRecord::Base
  belongs_to :plan
  has_many :box_items
  has_many :items, through: :box_items

  validates :title, :plan_id, presence: true

  default_scope { order(created_at: :desc) }

end
