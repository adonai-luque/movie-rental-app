class AddColumnToPastRental < ActiveRecord::Migration[6.1]
  def change
    add_column :past_rentals, :rental_date, :date
  end
end
