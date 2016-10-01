class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:visitor, :subscriber, :admin]

  belongs_to :subscription

  validates :first_name, :last_name, presence: true
end
