class ActivitiesService
  BASE_URL = 'http://boredapi.com/api/activity?type'

  def self.get_activity(type)
    response = Faraday.get("#{BASE_URL}=#{type}")
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end