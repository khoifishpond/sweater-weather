class MapService
  BASE_URL = 'http://www.mapquestapi.com'

  def self.get_data(city_state)
    response = Faraday.get("#{BASE_URL}/geocoding/v1/address?key=#{ENV['MAPQUEST_API']}&location=#{city_state}")
    JSON.parse(response.body, symbolize_names: true)
  end
end