class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :director, presence: true
  validates :release_date, presence: true
end
