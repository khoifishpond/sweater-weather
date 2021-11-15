require 'rails_helper'

describe 'Activity Request' do
  it 'gets a list of activities for a location dependent on weather' do
    get '/api/v1/activities?destination=chicago,il'
    activities = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end