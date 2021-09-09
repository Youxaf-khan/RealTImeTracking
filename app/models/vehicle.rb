require 'csv'
class Vehicle < ApplicationRecord
  def self.export_to_csv(invites)
    attributes = column_names

    CSV.generate(headers: true) do |csv|
      csv << attributes

      invites.each do |vehicle|
        csv << attributes.map { |attr| vehicle.send(attr) }
      end
    end
  end
end
