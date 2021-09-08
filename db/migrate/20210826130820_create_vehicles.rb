class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :identifier
      t.string :name
      t.text :gps
      t.datetime :time
      t.float :latitude
      t.float :longitude
      t.float :heading_degrees
      t.float :speed_miles_per_hour
      t.string :location
      t.boolean :is_ecu_speed

      t.timestamps
    end
  end
end
