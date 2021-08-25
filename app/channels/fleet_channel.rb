class FleetChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'fleet_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
