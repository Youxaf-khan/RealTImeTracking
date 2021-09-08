ActiveRecord::Schema.define(version: 2021_08_26_130820) do
  enable_extension 'plpgsql'

  create_table 'vehicles', force: :cascade do |t|
    t.string 'identifier'
    t.string 'name'
    t.text 'gps'
    t.datetime 'time'
    t.float 'latitude'
    t.float 'longitude'
    t.float 'heading_degrees'
    t.float 'speed_miles_per_hour'
    t.string 'location'
    t.boolean 'is_ecu_speed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
