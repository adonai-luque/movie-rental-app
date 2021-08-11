class AddUniqueConstraintToRentalMovieId < ActiveRecord::Migration[6.1]
  def change
    remove_index :rentals, :movie_id
    add_index :rentals, :movie_id, unique: true
  end
end
