class SamsaraApiService
  def self.call
    response = HTTParty.get('https://api.samsara.com/fleet/vehicles/stats?types=gps',
                            headers: { Authorization: "Bearer #{ENV['SAMSARA_API_KEY']}" })
    vehicles_data = response['data']

    ActionCable.server.broadcast 'fleet_channel', vehicles: vehicles_data if vehicles_data.present?
  end
end
