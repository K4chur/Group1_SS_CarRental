class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamp :date_from
      t.timestamp :date_to

      t.timestamps
    end
  end
end
