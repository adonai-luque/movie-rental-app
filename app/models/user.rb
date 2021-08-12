class User < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :movies, through: :rentals
  has_many :past_rentals, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A(.+)@(.+)\z/, message: "has an invalid format"  }
end
