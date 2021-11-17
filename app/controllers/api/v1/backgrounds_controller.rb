class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].nil?
      render json: error('Bad Request', 'Location is required', 400)
    else
      background = BackgroundFacade.image(params[:location])
      render json: BackgroundSerializer.new(background)
    end
  end
end