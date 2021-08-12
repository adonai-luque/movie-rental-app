class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :movie, uniqueness: true
end
