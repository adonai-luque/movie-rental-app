class Category < ApplicationRecord
  has_many :movies, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true
end
