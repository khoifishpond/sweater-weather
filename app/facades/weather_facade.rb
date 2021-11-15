class WeatherFacade
  def self.forecast(lat, long)
    data = WeatherService.get_data(lat, long)
    Forecast.new(data)
  end
end