require 'rails_helper'

describe RoadTrip do
  it 'exists' do
    params = {start_city: 'Cerritos, CA', end_city: 'San Diego, CA'}
    data = MapService.get_directions(params[:start_city], params[:end_city])[:route]
    destination = MapFacade.lat_long(params[:end_city])
    forecast = WeatherFacade.forecast(destination.lat, destination.long)
    roadtrip = RoadTrip.new(data, forecast)

    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.id).to eq(nil)
    expect(roadtrip.start_city).to eq(params[:start_city])
    expect(roadtrip.end_city).to eq(params[:end_city])
    expect(roadtrip.travel_time).to eq(data[:formattedTime])
    expect(roadtrip.weather_at_eta).to have_key(:temperature)
    expect(roadtrip.weather_at_eta[:temperature]).to eq(forecast.hourly[1].temperature)
    expect(roadtrip.weather_at_eta).to have_key(:temperature)
    expect(roadtrip.weather_at_eta[:conditions]).to eq(forecast.hourly[1].conditions)
  end
end