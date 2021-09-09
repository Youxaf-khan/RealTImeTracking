require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10s' do
  Vehicles::SyncLocationsJob.perform_later
end
