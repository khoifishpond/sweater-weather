class WeatherService
  BASE_URL = 'https://api.openweathermap.org'

  def self.get_data(lat, long)
    response = conn.get('/data/2.5/onecall') do |f|
      f.params['lat'] = lat
      f.params['lon'] = long
      f.params['exclude'] = 'minutely,alerts'
      f.params['units'] = 'imperial'
    end
    parse_json(response)
  end

  def self.conn
    Faraday.new(BASE_URL) do |f|
      f.params['appid'] = ENV['WEATHER_API']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end