class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :identifier
      t.string :name
      t.text :gps
      t.datetime :time
      t.float :latitude
      t.float :longitude
      t.float :headingDegrees
      t.float :speedMilesPerHour
      t.string :location
      t.boolean :isEcuSpeed

      t.timestamps
    end
  end
end
