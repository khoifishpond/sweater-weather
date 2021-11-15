class ActivitiesService
  BASE_URL = 'http://boredapi.com/api/activity?type='

  def self.get_relaxation
    response = Faraday.get("#{BASE_URL}recreational")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cooking
    response = Faraday.get("#{BASE_URL}cooking")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_busywork
    response = Faraday.get("#{BASE_URL}busywork")
    JSON.parse(response.body, symbolize_names: true)
  end
end