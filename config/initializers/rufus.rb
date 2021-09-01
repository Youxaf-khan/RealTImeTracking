require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1min' do
  SyncVehicles.perform_async
end
