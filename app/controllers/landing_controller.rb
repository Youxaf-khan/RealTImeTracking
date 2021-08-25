class LandingController < ApplicationController
  # vehicle controller will be used instead
  #after_action :call
  def create; end

  def index; end

  def update; end

  def destroy; end

  def call
    ActionCable.server.broadcast 'fleet_channel', content: @vehicle.content
  end
end
