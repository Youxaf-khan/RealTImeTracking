require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10s' do
  puts '-----------JOB START--------------'
  SyncVehiclesJob.perform_now
  puts '-----------JOB END--------------'
end
