class Api::V1::RoadTripController < ApplicationController
  def create
    roadtrip = MapFacade.roadtrip(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(roadtrip)
  end
end