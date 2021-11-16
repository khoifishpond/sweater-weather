class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(data, forecast)
    @id = nil
    @start_city = data[:locations][0][:adminArea5] + ", " + data[:locations][0][:adminArea3]
    @end_city = data[:locations][1][:adminArea5] + ", " + data[:locations][1][:adminArea3]
    @travel_time = data[:formattedTime]
    @weather_at_eta = format_weather(forecast)
  end

  def format_weather(forecast)
    {
      temperature: forecast.hourly[at_hour].temperature,
      conditions: forecast.hourly[at_hour].conditions
    }
  end

  def at_hour
    @travel_time[0, 2].to_i
  end
end