class VehiclesController < ApplicationController
  def show; end

  def export
    respond_to do |format|
      invites = Vehicles::InvitableService.call
      format.csv { send_data Vehicle.export_to_csv(invites), filename: 'Invitable_Vehicles.csv' }
    end
  end
end
