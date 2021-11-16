require 'rails_helper'

describe MapFacade do
  it 'gets the latitude and longitude of a location' do
    geocode = MapFacade.lat_long('Denver, CO')

    expect(geocode).to be_a(GeoCode)
  end

  it 'gets a roadmap from and to a location' do
    start_city = 'Cerritos, CA'
    end_city = 'San Diego, CA'
    roadmap = MapFacade.roadtrip(start_city, end_city)

    expect(roadmap).to be_a(RoadTrip)
  end
end