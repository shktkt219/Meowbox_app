class Box < ActiveRecord::Base
  has_many :user_boxes
  has_many :users, through: :user_boxes
end
