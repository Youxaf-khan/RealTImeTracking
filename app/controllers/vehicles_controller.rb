class VehiclesController < ApplicationController
  def index; end

  def export
    respond_to do |format|
      invites = Vehicles::InviteService.call
      format.csv { send_data Vehicle.export_to_csv(invites), filename: 'Invitation.csv' }
    end
  end
end
