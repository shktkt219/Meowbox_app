class Subscription < ActiveRecord::Base
  has_many :registration
  has_many :users, through: :registration
  has_many :boxes
end
