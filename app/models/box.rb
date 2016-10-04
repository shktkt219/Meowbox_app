class Box < ActiveRecord::Base
  belongs_to :plan
  has_many :box_items
  has_many :items, through: :box_items

  validates :title, :month_year, :plan_id, presence: true
  validates :title, :month_year, uniqueness: true
  accepts_nested_attributes_for :items, reject_if: :reject_items
  default_scope { order(created_at: :desc) }

  def reject_items(attributes)
    attributes['item_name'].blank? && attributes['size'].blank?
  end

end
