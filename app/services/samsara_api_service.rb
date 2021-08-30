class SamsaraApiService
  def intialize(); end

  def call
    track_vehicles = []
    response = HTTParty.get("https://api.samsara.com/fleet/vehicles/stats?types=gps", headers: {"Authorization" => "Bearer #{ENV['SAMSARA_API_KEY']}" })
    vehicles_data = response["data"]
    if vehicles_data.present?
      vehicles_data.each do |vehicle|
        locate(vehicle)
        track_vehicles << vehicle
      end
      track_vehicles
    end
  end

  def locate(vehicle)
    if vehicle.blank?
      return nil
    end

    id = vehicle['id']
    name = vehicle['name']
    gps = vehicle['gps']

    time = vehicle['gps']['time']
    latitude = vehicle['gps']['latitude']
    longitude = vehicle['gps']['longitude']
    headingdegree = vehicle['gps']['headingDegrees']
    speedmilesperhour = vehicle['gps']['speedMilesPerHour']
    address = vehicle['gps']['reverseGeo']['formattedLocation']
    isecuspeed = vehicle['gps']['isEcuSpeed']

    puts 'Saving location for vehicle:', vehicle['name']

    vehicle = Vehicle.find_or_create_by(id: vehicle['id'])
    vehicle.update(
      identifier: id,
      name: name,
      gps: gps,
      time: time,
      latitude: latitude,
      longitude: longitude,
      headingDegrees: headingdegree,
      speedMilesPerHour: speedmilesperhour,
      location: address,
      isEcuSpeed: isecuspeed
    )
      puts 'updating coordinates'
  end
end