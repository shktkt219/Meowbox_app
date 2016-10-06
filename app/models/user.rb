class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:admin]

  has_one :subscription
  has_one :plan, through: :subscription
  has_many :boxes, through: :plan

  validates :first_name, :last_name, presence: true
end
