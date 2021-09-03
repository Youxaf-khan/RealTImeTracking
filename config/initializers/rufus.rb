require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10s' do
  puts Time.now
  SyncVehicles.perform_in 10.seconds
  puts Time.now
end
