class User < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :movies, through: :rents
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A(.+)@(.+)\z/, message: "has an invalid format"  }
end
