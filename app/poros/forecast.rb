class Forecast
  attr_reader :current, :daily, :hourly

  def initialize(data)
    @current = CurrentWeather.new(data[:current])
    @daily = data[:daily][0..4].map do |day|
      DailyWeather.new(day)
    end
    @hourly = data[:hourly][0..7].map do |hour|
      HourlyWeather.new(hour)
    end
  end
end