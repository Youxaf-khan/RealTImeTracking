class SyncVehicles
  include Sidekiq::Worker

  def perform
    SamsaraApiService.new.call
  end
end
