class SyncVehiclesJob < ApplicationJob
  queue_as :default

  def perform
    SamsaraApiService.call
  end
end
