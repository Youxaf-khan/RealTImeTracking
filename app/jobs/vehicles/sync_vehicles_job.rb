module Vehicles
  class SyncVehiclesJob < ApplicationJob
    class Error < StandardError; end
    queue_as :default

    def perform
      Vehicles::UpdateService.call
    rescue SyncVehiclesJob::Error => e
      puts "Didn't work because #{e}"
    end
  end
end
