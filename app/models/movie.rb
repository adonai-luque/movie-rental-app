class Movie < ApplicationRecord
  belongs_to :category
  
  has_many :rents, dependent: :destroy
  has_many :users, through: :rents
  
  validates :name, presence: true
  validates :director, presence: true
  validates :release_date, presence: true
  
  def rented?
    self.users.any?
  end

  def user_id
    self.rented? ? self.users.first.id : nil
  end
end
