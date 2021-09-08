require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10s' do
  Vehicles::SyncVehiclesJob.perform_later
end
