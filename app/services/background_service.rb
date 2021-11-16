class BackgroundService
  BASE_URL = 'https://api.unsplash.com'

  def self.get_data(query)
    response = conn.get('/search/photos') do |f|
      f.params['query'] = query
      f.params['per_page'] = 1
    end
    parse_json(response)
  end

  def self.conn
    Faraday.new(BASE_URL) do |f|
      f.params['client_id'] = ENV['UNSPLASH_API']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end