require 'csv'
class Vehicle < ApplicationRecord
  def self.export_to_csv(vehicle)
    attributes = %w[id name location]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      vehicle.each do |truck|
        csv << attributes.map { |attr| truck.send(attr) }
      end
    end
  end
end
