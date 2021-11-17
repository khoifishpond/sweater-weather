require 'rails_helper'

describe 'Roadtrip Request' do
  it 'roadtrip information from and to a location' do
    post '/api/v1/road_trip', params: {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }
    roadtrip = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(roadtrip).to have_key(:data)
    expect(roadtrip[:data]).to have_key(:id)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data]).to have_key(:type)
    expect(roadtrip[:data][:type]).to eq('roadtrip')
    expect(roadtrip[:data]).to have_key(:attributes)
    expect(roadtrip[:data][:attributes]).to have_key(:start_city)
    expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)
    expect(roadtrip[:data][:attributes]).to have_key(:end_city)
    expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)
    expect(roadtrip[:data][:attributes]).to have_key(:travel_time)
    expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  describe 'Sad Path' do
    it 'shows an error without an origin or destination location' do
      post '/api/v1/road_trip', params: {
        origin: 'Denver, CO',
        api_key: 'jgn983hy48thw9begh98h4539h4'
      }
      error = JSON.parse(response.body, symbolize_names: true)
      
      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Bad Request')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('Origin and Destination locations are required')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(400)
    end

    it 'shows an error without an api key' do
      post '/api/v1/road_trip', params: {
        origin: 'Denver, CO',
        destination: 'Pueblo, CO'
      }
      error = JSON.parse(response.body, symbolize_names: true)
      
      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_an(Array)
      expect(error[:errors][0]).to have_key(:status)
      expect(error[:errors][0][:status]).to eq('Unauthorized')
      expect(error[:errors][0]).to have_key(:message)
      expect(error[:errors][0][:message]).to eq('API key is required')
      expect(error[:errors][0]).to have_key(:code)
      expect(error[:errors][0][:code]).to eq(401)
    end
  end
end