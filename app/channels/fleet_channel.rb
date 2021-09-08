class FleetChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'fleet_channel'
  end
end
