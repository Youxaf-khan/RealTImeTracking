module Vehicles
  class InvitableService < ApplicationService
    def initialize
      @home_lat = ENV['HOMEBASE_LATITUDE'].to_f
      @home_lng = ENV['HOMEBASE_LONGITUDE'].to_f
    end

    def call
      invite = []

      Vehicle.all.each do |vehicle|
        # Calculating distance of vehicles from home base and converting it into radian
        dis_lat = (vehicle.latitude - @home_lat) * Math::PI / 180
        dis_lng = (vehicle.longitude - @home_lng) * Math::PI / 180

        # Haversine formula
        distance = Math.sin(dis_lat / 2) * Math.sin(dis_lat / 2) +
                   Math.cos(@home_lat * Math::PI / 180) * Math.cos(vehicle.latitude * Math::PI / 180) *
                   Math.sin(dis_lng / 2) * Math.sin(dis_lng / 2)
        calculation = 2 * Math.atan2(Math.sqrt(distance), Math.sqrt(1 - distance))
        distance_from_base = 6371 * calculation

        # Checking if vehicle is in range
        invite << vehicle if distance_from_base < 200
      end

      invite
    end
  end

  private

  attr_reader :home_lat, :home_lng
end
