class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.pluck(:name, :latitude, :longitude, :location)
  end
end
