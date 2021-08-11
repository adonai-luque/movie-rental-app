class PastRental < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rental_date, presence: true
end
