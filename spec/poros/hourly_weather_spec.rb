require 'rails_helper'

describe HourlyWeather do
  it 'exists' do
    params = {lat: 39.74, lng: -104.99}
    data = WeatherService.get_data(params[:lat], params[:lng])
    hourly = HourlyWeather.new(data[:hourly][0])
    
    expect(hourly).to be_an(HourlyWeather)
    expect(hourly.time).to eq(Time.at(data[:hourly][0][:dt]).strftime('%I:%M %p'))
    expect(hourly.temperature).to eq(data[:hourly][0][:temp])
    expect(hourly.conditions).to eq(data[:hourly][0][:weather][0][:description])
    expect(hourly.icon).to eq(data[:hourly][0][:weather][0][:icon])
  end
end