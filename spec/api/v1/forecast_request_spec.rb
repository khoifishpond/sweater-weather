require 'rails_helper'

describe 'Forecast Request' do
  it 'gets the forecast for a location' do
    get '/api/v1/forecast?location=denver,co'
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data]).to have_key(:attributes)

    expect(forecast[:data][:attributes]).to have_key(:current)
    expect(forecast[:data][:attributes][:current]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current][:datetime]).to be_a(String)
    expect(forecast[:data][:attributes][:current]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:current]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:current]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current][:temperature]).to be_a(Float).or be_an(Integer)
    expect(forecast[:data][:attributes][:current]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current][:feels_like]).to be_a(Float).or be_an(Integer)
    expect(forecast[:data][:attributes][:current]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current][:humidity]).to be_an(Integer)
    expect(forecast[:data][:attributes][:current]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current][:uvi]).to be_a(Float).or be_an(Integer)
    expect(forecast[:data][:attributes][:current]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current][:visibility]).to be_an(Integer)
    expect(forecast[:data][:attributes][:current]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:current]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current][:icon]).to be_a(String)

    expect(forecast[:data][:attributes][:current]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:current]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:current]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:current]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:current]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:current]).to_not have_key(:wind_gust)

    expect(forecast[:data][:attributes]).to have_key(:daily)
    expect(forecast[:data][:attributes][:daily]).to be_an(Array)
    expect(forecast[:data][:attributes][:daily].count).to eq(5)
    forecast[:data][:attributes][:daily].each do |day|
      expect(day).to have_key(:date)
      expect(day[:date]).to be_a(String)
      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_a(String)
      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_a(String)
      expect(day).to have_key(:max_temp)
      expect(day[:max_temp]).to be_a(Float).or be_an(Integer)
      expect(day).to have_key(:min_temp)
      expect(day[:min_temp]).to be_a(Float).or be_an(Integer)
      expect(day).to have_key(:conditions)
      expect(day[:conditions]).to be_a(String)
      expect(day).to have_key(:icon)
      expect(day[:icon]).to be_a(String)
      expect(day).to_not have_key(:pressure)
      expect(day).to_not have_key(:dew_point)
      expect(day).to_not have_key(:clouds)
      expect(day).to_not have_key(:wind_speed)
      expect(day).to_not have_key(:wind_deg)
      expect(day).to_not have_key(:wind_gust)
    end

    expect(forecast[:data][:attributes]).to have_key(:hourly)
    expect(forecast[:data][:attributes][:hourly]).to be_an(Array)
    expect(forecast[:data][:attributes][:hourly].count).to eq(8)
    forecast[:data][:attributes][:hourly].each do |hour|
      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)
      expect(hour).to have_key(:temperature)
      expect(hour[:temperature]).to be_a(Float).or be_an(Integer)
      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)
      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
      expect(hour).to_not have_key(:pressure)
      expect(hour).to_not have_key(:dew_point)
      expect(hour).to_not have_key(:clouds)
      expect(hour).to_not have_key(:wind_speed)
      expect(hour).to_not have_key(:wind_deg)
      expect(hour).to_not have_key(:wind_gust)
    end
  end

  describe 'Sad Path' do
    it 'shows an error without a location' do
      get '/api/v1/forecast'
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Bad Request')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('Location is required')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(400)
    end
  end
end