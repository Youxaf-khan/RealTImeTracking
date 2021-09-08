class Vehicle < ApplicationRecord

  def self.distance()
    invite = []
    home_lat = 37.998819
    home_lng = -121.2866481

    all.each do |vehicle|
      dis_lat = (vehicle.latitude - home_lat)
      dis_lng = (vehicle.longitude - home_lng)
      dis_lat = dis_lat * Math::PI / 180
      dis_lng = dis_lng * Math::PI / 180

      a = Math.sin(dis_lat / 2) * Math.sin(dis_lat / 2) +
          Math.cos(home_lat * Math::PI / 180) * Math.cos(vehicle.latitude * Math::PI / 180) *
          Math.sin(dis_lng / 2) * Math.sin(dis_lng / 2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      d = 6371 * c

      if d < 200
        invite << vehicle
      end
    end
    export_via_csv(invite)
  end

  def export_via_csv(vehicle)

  end
end
