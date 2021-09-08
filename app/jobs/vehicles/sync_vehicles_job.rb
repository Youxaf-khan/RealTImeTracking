module Vehicles
  class SyncVehiclesJob < ApplicationJob
    queue_as :default

    def perform
      Samsara::UpdateVehiclesService.call
    end
  end
end
