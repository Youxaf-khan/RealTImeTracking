module Vehicles
  class UpdateService < ApplicationService
    def initialize
      @response = Samsara::Api::GetVehiclesService.call
    end

    def call
      @response['data'].each { |vehicle| update_vehicle(vehicle) }
      ActionCable.server.broadcast 'vehicles_channel', vehicles: @response['data']
    end

    private

    def update_vehicle(vehicle)
      return nil if vehicle.blank?

      Vehicle.find_or_initialize_by(id: vehicle['id']).update(
        identifier: vehicle['id'],
        name: vehicle['name'],
        gps: vehicle['gps'],
        time: vehicle['gps']['time'],
        latitude: vehicle['gps']['latitude'],
        longitude: vehicle['gps']['longitude'],
        heading_degrees: vehicle['gps']['headingDegrees'],
        speed_miles_per_hour: vehicle['gps']['speedMilesPerHour'],
        location: vehicle['gps']['reverseGeo']['formattedLocation'],
        is_ecu_speed: vehicle['gps']['isEcuSpeed']
      )
    end
  end
end
