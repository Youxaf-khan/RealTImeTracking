class VehiclesController < ApplicationController
  def show; end

  def export
    invites = Vehicles::InvitableService.call

    respond_to do |format|
      format.csv { send_data Vehicle.export_to_csv(invites), filename: 'Invitable_Vehicles.csv' }
    end
  end
end
