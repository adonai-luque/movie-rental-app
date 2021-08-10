class Category < ApplicationRecord
  has_many :movies
  
  validates :name, presence: true
  validates :description, presence: true
end
