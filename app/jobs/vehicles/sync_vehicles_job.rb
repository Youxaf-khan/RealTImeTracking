module Vehicles
  class SyncVehiclesJob < ApplicationJob
    queue_as :default

    def perform
      Vehicles::UpdateVehiclesService.call
    end
  end
end
