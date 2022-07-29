class Api::V1::RoadTripController < ApplicationController
  def create
    if params[:api_key].nil? || params[:api_key].empty?
      render json: error('Unauthorized', 'API key is required', 401)
    elsif params[:origin].nil? || params[:destination].nil?
      render json: error('Bad Request', 'Origin and Destination locations are required', 400)
    else
      roadtrip = MapFacade.roadtrip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(roadtrip)
    end
  end
end