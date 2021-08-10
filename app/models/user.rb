class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, format: { with: /^(.+)@(.+)$/, message: "Invalid Email"  }
end
