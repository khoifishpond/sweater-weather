class Api::V1::RoadTripController < ApplicationController
  def create
    if params[:origin].nil? || params[:destination].nil?
      render json: error('Bad Request', 'Origin and Destination locations are required', 400)
    elsif params[:api_key].nil?
      render json: error('Unauthorized', 'API key is required', 401)
    else
      roadtrip = MapFacade.roadtrip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(roadtrip)
    end
  end
end