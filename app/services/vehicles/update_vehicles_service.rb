module Vehicles
  class UpdateVehiclesService < ApplicationService
    def initialize
      @response = Samsara::Api::GetVehiclesService.call
    end

    def call
      @vehicles_data = @response['data']
      @vehicles_data.each do |vehicle|
        update_vehicle(vehicle)
      end
      ActionCable.server.broadcast 'fleet_channel', vehicles: @response['data']
    end

    def update_vehicle(vehicle)
      return nil if vehicle.blank?

      wheels = Vehicle.find_or_create_by(id: vehicle['id'])
      wheels.update(
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
