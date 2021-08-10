class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A(.+)@(.+)\z/, message: "has an invalid format"  }
end
