require 'csv'
class Vehicle < ApplicationRecord
  def self.export_to_csv(vehicle)
    attributes = %w{id name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      vehicle.each do |v|
        csv << attributes.map { |attr| v.send(attr) }
      end
    end
  end
end
