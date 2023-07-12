class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.float :engine_capacity
      t.string :fuel_type
      t.float :daily_price
      t.float :fuel_consumption
      t.string :img

      t.timestamps
    end
  end
end
