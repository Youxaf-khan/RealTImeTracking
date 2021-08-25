class SamsaraApiSevice
  def intialize(vehicleIds = [])
    if vehicleIds.present?
      @full_url = "https://api.samsara.com/fleet/vehicles/stats?vehicleIds=#{vehicleIds}"
    else
      puts 'No fleets to track'
    end
  end

  def query
    track_vehicles = []
    response = HTTParty.get(@full_url)
    vehicles_data = response["data"]
    if vehicles_data.present?
      vehicles_data.each do |vehicle|
        locate(vehicle)
        track_vehicles << vehicle["address"] if vehicle["address"]
      end
      track_vehicles
    end
  end

  def locate(vehicle)
    if vehicle.blank?
      return nil
    end
    gps = vehicle['gps']
    address = vehicle['address']
    id = vehicle['id']
    name = vehicle['name']
    latitude = vehicle['latitude']
    longitude = vehicle['longitude']
  end
end
