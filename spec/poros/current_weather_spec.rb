require 'rails_helper'

describe CurrentWeather do
  it 'exists' do
    params = {lat: 39.74, lng: -104.99}
    data = WeatherService.get_data(params[:lat], params[:lng])
    current = CurrentWeather.new(data[:current])

    expect(current).to be_a(CurrentWeather)
    expect(current.datetime).to eq(Time.at(data[:current][:dt]))
    expect(current.sunrise).to eq(Time.at(data[:current][:sunrise]))
    expect(current.sunset).to eq(Time.at(data[:current][:sunset]))
    expect(current.temperature).to eq(data[:current][:temp])
    expect(current.feels_like).to eq(data[:current][:feels_like])
    expect(current.humidity).to eq(data[:current][:humidity])
    expect(current.uvi).to eq(data[:current][:uvi])
    expect(current.visibility).to eq(data[:current][:visibility])
    expect(current.conditions).to eq(data[:current][:weather][0][:description])
    expect(current.icon).to eq(data[:current][:weather][0][:icon])
  end
end