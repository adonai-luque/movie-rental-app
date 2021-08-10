class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :director, presence: true
  validates :release_date, presence: true

  def rent(user_id)
    return if self.rented?
    
    self.user_id = user_id
    self.save
  end

  def unrent
    return unless self.rented?

    self.user_id = nil
    self.save
  end
  
  def rented?
    return false unless self.user_id
    
    true
  end



end
