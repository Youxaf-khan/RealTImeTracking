class VehiclesController < ApplicationController
  def create; end

  def index
    @vehicles = Vehicle.order(created_at: :desc)

    ActionCable.server.broadcast 'fleet_channel', vehicle: @vehicles.first
  end

  def show; end

  def update; end

  def destroy; end
end
