require 'uri'
module Samsara
  module Api
    class GetVehiclesService < ApplicationService
      include HTTParty
      base_uri 'https://api.samsara.com'

      attr_accessor :response

      def call
        self.class.get('/fleet/vehicles/stats?types=gps', headers: { Authorization: "Bearer #{ENV['SAMSARA_API_KEY']}" })
      end
    end
  end
end
