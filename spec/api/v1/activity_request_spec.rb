require 'rails_helper'

describe 'Activity Request' do
  it 'gets a list of activities for a location dependent on weather' do
    get '/api/v1/activities?destination=chicago,il'
    activities = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(activities).to be_a(Hash)
    expect(activities).to have_key(:data)
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data][:id]).to eq(nil)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data][:type]).to eq('activities')

    expect(activities[:data]).to have_key(:attributes)
    expect(activities[:data][:attributes]).to have_key(:destination)
    expect(activities[:data][:attributes][:destination]).to be_a(String)
    expect(activities[:data][:attributes]).to have_key(:forecast)
    expect(activities[:data][:attributes][:forecast]).to have_key(:summary)
    expect(activities[:data][:attributes][:forecast]).to have_key(:temperature)
    
    expect(activities[:data][:attributes]).to have_key(:activities)
    expect(activities[:data][:attributes][:activities]).to be_an(Array)
    activities[:data][:attributes][:activities].each do |activity|
      expect(activity).to have_key(:title)
      expect(activity[:title]).to be_a(String)
      expect(activity).to have_key(:type)
      expect(activity[:type]).to be_a(String)
      expect(activity).to have_key(:participants)
      expect(activity[:participants]).to be_an(Integer)
      expect(activity).to have_key(:price)
      expect(activity[:price]).to be_a(Float).or be_an(Integer)
    end
  end
end