class VehiclesController < ApplicationController
  # before_action :set_vehicle, only: [:index, :show, :update, :destroy ]

  def create; end

  def index
    @vehicles = Vehicle.pluck(:id, :latitude, :longitude)
  end

  def show; end

  def edit
    # @vehicles = Vehicle.order(created_at: :desc)
  end

  def destroy; end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
