class Plan < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :boxes

  validates_presence_of :name, :description, :price
  validates :price, numericality: { greater_than: 0 }
end
