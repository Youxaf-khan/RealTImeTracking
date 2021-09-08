class SamsaraApiService
  def self.call
    response = HTTParty.get('https://api.samsara.com/fleet/vehicles/stats?types=gps',
                            headers: { Authorization: "Bearer #{ENV['SAMSARA_API_KEY']}" })
    vehicles_data = response['data']

    if vehicles_data.present?
      vehicles_data.each_with_index do |vehicle, index|
        locate(vehicle)
      end
    end

    ActionCable.server.broadcast 'fleet_channel', vehicles: vehicles_data if vehicles_data.present?
  end

  def self.locate(vehicle)
    return nil if vehicle.blank?

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
    # puts 'Saving location for vehicle:', vehicle['name']
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
  end
end
