class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.references :category, null: false, foreign_key: true
      t.date :release_date
      
      t.timestamps
    end
  end
end
