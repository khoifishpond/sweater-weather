class WeatherService
  BASE_URL = 'https://api.openweathermap.org'

  def self.get_data(lat, long)
    response = Faraday.get("#{BASE_URL}/data/2.5/onecall?lat=#{lat}&lon=#{long}&exclude=minutely,alerts&units=imperial&appid=#{ENV['WEATHER_API']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end