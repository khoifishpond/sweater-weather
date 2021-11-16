class Api::V1::RoadTripController < ApplicationController
  def create
    require 'pry'; binding.pry
    roadtrip = MapFacade.roadtrip(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(roadtrip)
  end
end