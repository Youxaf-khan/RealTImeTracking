<<<<<<< HEAD
require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10s' do
  puts Time.now
  SyncVehicles.perform_in 10.seconds
  puts Time.now
=======
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1min' do
  SyncVehicles.perform_async
>>>>>>> 13d76ca02c33e72586114f4badb5087c61c51755
end
