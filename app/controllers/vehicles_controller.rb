class VehiclesController < ApplicationController
  # before_action :set_vehicle, only: [:index, :show, :update, :destroy ]

  def create; end

  def index
    @vehicles = Vehicle.order(created_at: :desc)
    ActionCable.server.broadcast 'fleet_channel', vehicle: @vehicles
  end

  def show; end

  def update; end

  def destroy; end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

end
