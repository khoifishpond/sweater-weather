class MapFacade
  def self.lat_long(city_state)
    data = MapService.get_data(city_state)[:results][0][:locations][0][:latLng]
    GeoCode.new(data)
  end

  def self.roadtrip(start_city, end_city)
    data = MapService.get_directions(start_city, end_city)
    destination = MapFacade.lat_long(end_city)
    forecast = WeatherFacade.forecast(destination.lat, destination.long)
    RoadTrip.new(data, forecast, start_city, end_city)
  end
end