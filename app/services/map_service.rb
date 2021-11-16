class MapService
  BASE_URL = 'http://www.mapquestapi.com'

  def self.get_data(city_state)
    response = conn.get('/geocoding/v1/address') do |f|
      f.params['location'] = city_state
    end
    parse_json(response)
  end

  def self.get_directions(from, to)
    response = conn.get('/directions/v2/route') do |f|
      f.params['from'] = from
      f.params['to'] = to
    end
    parse_json(response)
  end
  
  def self.conn
    Faraday.new(BASE_URL) do |f|
      f.params['key'] = ENV['MAPQUEST_API']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end