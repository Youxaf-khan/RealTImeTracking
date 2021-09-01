class VehiclesController < ApplicationController
  def create; end

  def index
    @vehicles = Vehicle.pluck(:identifier, :latitude, :longitude, :location)
  end

  def show; end

  def edit; end

  def destroy; end
end
