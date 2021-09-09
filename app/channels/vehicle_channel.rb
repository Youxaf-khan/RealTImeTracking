class VehicleChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'vehicle_channel'
  end
end
