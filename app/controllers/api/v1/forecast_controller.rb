class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].nil?
      render json: error('Bad Request', 'Location is required', 400)
    else
      geocode = MapFacade.lat_long(params[:location])
      forecast = WeatherFacade.forecast(geocode.lat, geocode.long)
      render json: ForecastSerializer.new(forecast)
    end
  end
end