class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(data, forecast, start_city, end_city)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time = format_travel_time(data)
    @weather_at_eta = format_weather(data, forecast)
  end

  def format_travel_time(data)
    if data[:info][:statuscode] == 0
      data[:route][:formattedTime]
    else
      'Impossible'
    end
  end

  def format_weather(data, forecast)
    if data[:info][:statuscode] == 0
      {
        temperature: forecast.all_hours[at_hour][:temp],
        conditions: forecast.all_hours[at_hour][:weather][0][:description]
      }
    else
      {}
    end
  end

  def at_hour
    @travel_time[0, 2].to_i
  end
end