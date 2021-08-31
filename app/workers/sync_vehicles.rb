class SyncVehicles
  include Sidekiq::Worker

  def perform
    SamsaraApiService.call
  end
end
