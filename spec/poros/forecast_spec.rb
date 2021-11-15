require 'rails_helper'

describe Forecast do
  it 'exists' do
    params = {lat: 39.74, lng: -104.99}
    data = WeatherService.get_data(params[:lat], params[:lng])
    forecast = Forecast.new(data)
    
    expect(forecast).to be_a(Forecast)
    expect(forecast.current).to be_a(CurrentWeather)
    expect(forecast.daily).to be_an(Array)
    forecast.daily.each do |day|
      expect(day).to be_a(DailyWeather)
    end
    expect(forecast.daily.count).to eq(5)
    expect(forecast.hourly).to be_an(Array)
    forecast.hourly.each do |hour|
      expect(hour).to be_an(HourlyWeather)
    end
    expect(forecast.hourly.count).to eq(8)
  end
end