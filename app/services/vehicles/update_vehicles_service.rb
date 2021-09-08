module Samsara
  class UpdateVehiclesService < ApplicationService
    def initialize
      @response = Samsara::Api::GetVehiclesService.call
    end

    def call
      puts @response['data']
      @vehicles_data = @response['data']
      @vehicles_data.each do |vehicle|
        update_vehicle(vehicle)
      end
      ActionCable.server.broadcast 'fleet_channel', vehicles: @response['data']
    end

    def update_vehicle(vehicle)
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

      vehicle = Vehicle.find_or_create_by(id: id)
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
end
