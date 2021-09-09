module Vehicles
  class SyncLocationsJob < ApplicationJob
    class Error < StandardError; end
    queue_as :default

    def perform
      Vehicles::UpdateService.call
    rescue SyncLocationsJob::Error => e
      puts "Didn't work because #{e}"
    end
  end
end
