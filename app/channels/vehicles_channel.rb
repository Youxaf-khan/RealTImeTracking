class VehiclesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'vehicles_channel'
  end
end
