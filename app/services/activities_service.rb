class ActivitiesService
  def self.get_activity(type)
    response = conn.get('/api/activity') do |req|
      req.params['type'] = type
    end

    parse_data(response)
  end

  private

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'http://www.boredapi.com',
      headers: { 'Content-Type' => 'application/json' })
  end
end