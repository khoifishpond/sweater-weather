class Api::V1::ForecastController < ApplicationController
  def index
    geocode = MapFacade.lat_long(params[:location])
    forecast = WeatherFacade.forecast(geocode.lat, geocode.long)
    render json: ForecastSerializer.new(forecast)
  end
end