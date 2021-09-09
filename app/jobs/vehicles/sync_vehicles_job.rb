module Vehicles
  class SyncVehiclesJob < ApplicationJob
    queue_as :default

    def perform
      Vehicles::UpdateService.call
    end
  end
end
