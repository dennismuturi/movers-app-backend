class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_name
      t.string :vehicle_type
      t.string :vehicle_color
      t.string :vehicle_number
      t.references :mover, null: false, foreign_key: true

      t.timestamps
    end
  end
end
