require 'rails_helper'

describe DailyWeather do
  it 'exists' do
    params = {lat: 39.74, lng: -104.99}
    data = WeatherService.get_data(params[:lat], params[:lng])
    daily = DailyWeather.new(data[:daily][0])

    expect(daily).to be_a(DailyWeather)
    expect(daily.date).to eq(Time.at(data[:daily][0][:dt]).strftime('%Y-%m-%d'))
    expect(daily.sunrise).to eq(Time.at(data[:daily][0][:sunrise]))
    expect(daily.sunset).to eq(Time.at(data[:daily][0][:sunset]))
    expect(daily.max_temp).to eq(data[:daily][0][:temp][:max])
    expect(daily.min_temp).to eq(data[:daily][0][:temp][:min])
    expect(daily.conditions).to eq(data[:daily][0][:weather][0][:description])
    expect(daily.icon).to eq(data[:daily][0][:weather][0][:icon])
  end
end