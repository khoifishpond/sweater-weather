class Forecast
  attr_reader :id, :current, :daily, :hourly

  def initialize(data)
    @id = nil
    @current = CurrentWeather.new(data[:current])
    @daily = five_day_forecast(data)
    @hourly = eight_hour_forecast(data)
  end

  def five_day_forecast(data)
    data[:daily][0..4].map do |day|
      DailyWeather.new(day)
    end
  end

  def eight_hour_forecast(data)
    data[:hourly][0..7].map do |hour|
      HourlyWeather.new(hour)
    end
  end
end